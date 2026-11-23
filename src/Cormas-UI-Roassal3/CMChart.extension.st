Extension { #name : 'CMChart' }

{ #category : '*Cormas-UI-Roassal3' }
CMChart >> add: aLegend below: aCanvas [
	"Add aLegend below the chart of aCanvas, its entries wrapped on lines as wide as the chart. A legend of more than three lines would hide the chart, so a note replaces it"

	| note |
	aLegend location below offset: 0 @ 18.
	(aLegend layout layout linesFor: aLegend shapes) size > 3 ifFalse: [
		^ aLegend build ].
	note := RSLabel new
		        text: '(legend is too big to be displayed)';
		        color: Color gray;
		        yourself.
	aLegend location move: note on: aCanvas shapes.
	aCanvas add: note
]

{ #category : '*Cormas-UI-Roassal3' }
CMChart >> canvasOf: someSeries hiding: aSetOfNames [
	"Return a canvas with the chart of someSeries, whose x axis ends at its last value, and a legend naming each of them. The series named in aSetOfNames are hidden. Clicking an entry of the legend hides its series, or shows it again, and updates aSetOfNames"
	^ self canvasOf: someSeries hiding: aSetOfNames leavingRoomToGrow: false
]

{ #category : '*Cormas-UI-Roassal3' }
CMChart >> canvasOf: someSeries hiding: aSetOfNames leavingRoomToGrow: aBoolean [
	"Return a canvas with the chart of someSeries and a legend naming each of them. The series named in aSetOfNames are hidden. Clicking an entry of the legend hides its series, or shows it again, and updates aSetOfNames. The x axis ends at the last value, unless aBoolean leaves room up to the next tick, so that a chart growing step by step is not drawn with a new range at each step. Values on x that are not all numbers are shown as categories"

	| categories plots roassalChart canvas shapes legend |
	categories := self xCategoriesOf: someSeries.
	plots := self plotsOf: (categories
			          ifEmpty: [ someSeries ]
			          ifNotEmpty: [
			          someSeries collect: [ :each |
				          self place: each in: categories ] ]).
	roassalChart := self
		                roassalChartOf: plots
		                xCategories: categories
		                leavingRoomToGrow: aBoolean.
	canvas := roassalChart canvas.
	plots ifNotEmpty: [ roassalChart build ].
	shapes := Dictionary new.
	plots do: [ :each |
		shapes at: each key name put: each value createdShapes asArray ].
	legend := RSLegend new.
	legend container: canvas.
	legend layout flow
		maxWidth: roassalChart extent x;
		gapSize: 12.
	someSeries do: [ :each |
			| entry drawn drawnColors |
			entry := legend text: each name withBoxColor: each color.
			entry shapes first border: (RSBorder new
					 color: each color;
					 width: 1.5;
					 yourself).
			drawn := (shapes at: each name ifAbsent: [ #(  ) ])
			         , { entry shapes first }.
			drawnColors := drawn collect: [ :shape | shape color ].
			entry
				when: RSMouseClick
				do: [ :event |
						(aSetOfNames includes: each name)
							ifTrue: [ aSetOfNames remove: each name ]
							ifFalse: [ aSetOfNames add: each name ].
						self
							color: drawn
							as: drawnColors
							hiding: (aSetOfNames includes: each name).
						canvas signalUpdate ]
				for: self.
			self
				color: drawn
				as: drawnColors
				hiding: (aSetOfNames includes: each name) ].
	showsLegend ifTrue: [ self add: legend below: canvas ].
	^ canvas
]

{ #category : '*Cormas-UI-Roassal3' }
CMChart >> categoriesOf: someValues [

	(someValues allSatisfy: [ :each | each isNumber ]) ifTrue: [ ^ #(  ) ].
	^ someValues asOrderedCollection
		  removeDuplicates;
		  yourself
]

{ #category : '*Cormas-UI-Roassal3' }
CMChart >> color: someShapes as: someColors hiding: aBoolean [
	"Give the shapes that draw a series and its legend box the colors they were drawn with, or make them transparent when the series is hidden. The box keeps its border, so that it shows the color of a hidden series"

	someShapes with: someColors do: [ :shape :color |
			shape color: (aBoolean
					 ifTrue: [ Color transparent ]
					 ifFalse: [ color ]) ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMChart >> place: aSeriesData in: someCategories [
	"Return a copy of aSeriesData with each step at the position of its category on the x axis"

	^ CMSeriesData
		  named: aSeriesData name
		  color: aSeriesData color
		  steps:
		  (aSeriesData steps collect: [ :each |
			   someCategories indexOf: each ])
		  values: aSeriesData values
]

{ #category : '*Cormas-UI-Roassal3' }
CMChart >> plotsOf: someSeries [
	"Return, for each of someSeries that can be drawn, an association from it to the Roassal plot that draws it"

	^ self subclassResponsibility
]

{ #category : '*Cormas-UI-Roassal3' }
CMChart >> roassalChartOf: somePlots xCategories: someCategories leavingRoomToGrow: aBoolean [
	"Return a Roassal chart that draws the plots of the associations somePlots, with x and y axis lines but no frame, and ticks labelled without needless decimals. Axes of values that are not negative start at 0. The chart cannot be zoomed nor dragged, but fits the space it is shown in. The x axis has a tick for each of someCategories, or else ends at its last value, unless aBoolean leaves room up to the next tick"

	| roassalChart yValues yTicks |
	roassalChart := RSCompositeChart new.
	roassalChart container: (RSCanvas new
			 addInteraction: (RSZoomToFitCanvasInteraction new
					  useZoomToFitOnExtentChanged;
					  yourself);
			 yourself).
	roassalChart extent: 800 @ 400.
	roassalChart spineDecoration: CMChartAxes new.
	roassalChart decorations removeAll:
		(roassalChart decorations select: [ :each | each isHorizontalTick ]).
	roassalChart addDecoration: CMChartXTicks new.
	title ifNotNil: [ roassalChart title: title ].
	xTitle ifNotNil: [ roassalChart xlabel: xTitle ].
	yTitle ifNotNil: [ roassalChart ylabel: yTitle ].
	somePlots do: [ :each | roassalChart add: each value ].
	somePlots ifEmpty: [ ^ roassalChart ].
	someCategories
		ifEmpty: [
				self
					setXAxisOf: roassalChart
					from:
					(somePlots flatCollect: [ :each | each value definedValuesX ])
					leavingRoomToGrow: aBoolean ]
		ifNotEmpty: [ self setXAxisOf: roassalChart to: someCategories ].
	yValues := somePlots flatCollect: [ :each |
		           each value definedValuesY ].
	yTicks := self
		          ticksFrom: (yValues min min: 0)
		          to: yValues max
		          wholeNumbers:
		          (yValues allSatisfy: [ :each | each isInteger ]).
	roassalChart
		minChartValueY: yTicks first;
		maxChartValueY: yTicks last;
		yTicks: yTicks labels: (self tickLabelsOf: yTicks).
	^ roassalChart
]

{ #category : '*Cormas-UI-Roassal3' }
CMChart >> seriesDataOf: aRecordedObject in: aSimulation [
	"Return the data to draw, as CMSeriesData, from what was recorded in aSimulation, in the order of my series. A series without ofAll: shows aRecordedObject: the model, or the entity whose chart I am"

	| data |
	series do: [ :each | each checkIsProbeOf: aRecordedObject class ].
	data := OrderedCollection new.
	series do: [ :each |
		each addSeriesDataOf: aRecordedObject in: aSimulation to: data ].
	^ data
]

{ #category : '*Cormas-UI-Roassal3' }
CMChart >> setXAxisOf: aRoassalChart from: xValues leavingRoomToGrow: aBoolean [
	"Set the ticks of a numeric x axis showing xValues: from 0, or from the first value when it is negative, to the last value, or up to the next tick when aBoolean leaves room to grow"

	| xTicks |
	xTicks := self
		          ticksFrom: (xValues min min: 0)
		          to: xValues max
		          wholeNumbers:
		          (xValues allSatisfy: [ :each | each isInteger ]).
	aBoolean ifFalse: [
		xTicks := xTicks select: [ :each | each <= xValues max ] ].
	aRoassalChart
		minChartValueX: xTicks first - self xMargin;
		maxChartValueX: (aBoolean
				 ifTrue: [ xTicks last + self xMargin ]
				 ifFalse: [ xValues max + self xMargin ]);
		xTicks: xTicks labels: (self tickLabelsOf: xTicks)
]

{ #category : '*Cormas-UI-Roassal3' }
CMChart >> setXAxisOf: aRoassalChart to: someCategories [
	"Set a tick for each of someCategories at 1, 2, 3 and so on, named after it, with half a tick on each side so that nothing is drawn on the y axis"

	aRoassalChart
		minChartValueX: 1 / 2;
		maxChartValueX: someCategories size + (1 / 2);
		xTicks: (1 to: someCategories size) asArray
		labels: (someCategories collect: [ :each | each asString ]) asArray
]

{ #category : '*Cormas-UI-Roassal3' }
CMChart >> tickLabelsOf: someTicks [
	"Each tick with as many decimals as their spacing needs: 1, 2, 3 for whole numbers, 0.0, 0.2, 0.4 for ticks 0.2 apart"

	| decimals |
	decimals := 0.
	someTicks size > 1 ifTrue: [
			[
				(someTicks second - someTicks first * (10 raisedTo: decimals))
					isInteger ] whileFalse: [ decimals := decimals + 1 ] ].
	^ someTicks collect: [ :each |
			  decimals = 0
				  ifTrue: [ each printString ]
				  ifFalse: [ each asFloat printShowingDecimalPlaces: decimals ] ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMChart >> ticksFrom: aLowest to: aHighest wholeNumbers: aBoolean [
	"About five evenly spaced ticks, 1, 2 or 5 times a power of ten apart, from at most aLowest to at least aHighest. They are exact numbers, so that they can be labelled with as many decimals as their spacing needs. Spacings are compared as floats, since the values may be floats"

	| highest spacing power |
	highest := aHighest = aLowest
		           ifTrue: [ aLowest + 1 ]
		           ifFalse: [ aHighest ].
	power := 10 raisedTo: (highest - aLowest / 5 log: 10) floor.
	spacing := #( 1 2 5 10 )
		           detect: [ :each |
		           (each * power) asFloat >= (highest - aLowest / 5) asFloat ]
		           ifNone: [ 10 ].
	spacing := spacing * power.
	aBoolean ifTrue: [ spacing := spacing max: 1 ].
	^ ((aLowest / spacing) floor * spacing to:
	   (highest / spacing) ceiling * spacing by: spacing) asArray
]

{ #category : '*Cormas-UI-Roassal3' }
CMChart >> xCategoriesOf: someSeries [
	"Return the values on my x axis, in the order they first appear, when they are not all numbers; or else none, and my x axis is numeric"

	^ self categoriesOf: (someSeries flatCollect: [ :each | each steps ])
]

{ #category : '*Cormas-UI-Roassal3' }
CMChart >> xMargin [
	"The space left on each side of the x axis, beyond its first and last ticks"

	^ 0
]
