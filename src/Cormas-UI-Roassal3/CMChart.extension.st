Extension { #name : 'CMChart' }

{ #category : '*Cormas-UI-Roassal3' }
CMChart >> addSeriesOf: aSelector ofAll: aClass in: someDataTables to: someSeries [
	"Add to someSeries those that show the probe aSelector of all instances of aClass, from their data tables"

	self subclassResponsibility
]

{ #category : '*Cormas-UI-Roassal3' }
CMChart >> addSeriesOfEachInstance: aSelector in: someDataTables to: someSeries [
	"Add to someSeries one series for the probe aSelector of each instance, named after the probe and the instance"

	someDataTables do: [ :data |
			someSeries add: (CMChartSeries
					 named: (self labelFor: aSelector) , ' of ' , data label
					 color: (self roassalColorFor: aSelector at: someSeries size + 1)
					 steps: data steps asArray
					 values: (self numbersOf: aSelector inInstanceData: data)) ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMChart >> addSpreadOf: aSelector ofAll: aClass in: someDataTables to: someSeries [
	"Add to someSeries one series whose value at each step is the collection of the values of the probe aSelector of the instances recorded at that step"

	| spreads steps |
	spreads := Dictionary new.
	someDataTables do: [ :data |
			(self numbersOf: aSelector inInstanceData: data)
				with: data steps
				do: [ :value :step |
					(spreads at: step ifAbsentPut: [ OrderedCollection new ]) add:
						value ] ].
	steps := spreads keys sorted asArray.
	someSeries add: (CMChartSeries
			 named: (self labelFor: aSelector) , ' of ' , aClass name
			 color: (self roassalColorFor: aSelector at: someSeries size + 1)
			 steps: steps
			 values: (steps collect: [ :each | (spreads at: each) asArray ]))
]

{ #category : '*Cormas-UI-Roassal3' }
CMChart >> canvasOf: someSeries hiding: aSetOfNames [
	"Return a canvas with the chart of someSeries and a legend naming each of them. The series named in aSetOfNames are hidden. Clicking an entry of the legend hides its series, or shows it again, and updates aSetOfNames"

	| plots roassalChart canvas shapes legend |
	plots := self plotsOf: someSeries.
	roassalChart := self roassalChartOf: plots.
	plots ifEmpty: [ canvas := RSCanvas new ] ifNotEmpty: [
			roassalChart build.
			canvas := roassalChart canvas ].
	shapes := Dictionary new.
	plots do: [ :each |
		shapes at: each key name put: each value createdShapes asArray ].
	legend := RSLegend new.
	legend container: canvas.
	legend layout horizontal gapSize: 12.
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
	legend location below offset: 0 @ 18.
	legend build.
	^ canvas
]

{ #category : '*Cormas-UI-Roassal3' }
CMChart >> check: aSelector isProbeOf: aClass [

	(aClass probeSelectors includes: aSelector) ifFalse: [
			self error:
				('#{1} is not a probe of {2}: only <probe> methods are recorded'
					 format: {
							 aSelector.
							 aClass name }) ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMChart >> checkProbesOf: aClass [
	"Raise an error for a probe of a method that is not a probe: it can never be recorded"

	subjectProbes do: [ :each | self check: each isProbeOf: aClass ].
	probesOfAll do: [ :each | self check: each key isProbeOf: each value ]
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
CMChart >> numbersOf: aSelector in: aDataTable [

	| column |
	column := aDataTable column: aSelector.
	(column isEmpty or: [ column first isNumber ]) ifFalse: [
			self error:
				('The chart shows numbers, but #{1} returned {2}' format: {
						 aSelector.
						 column first printString }) ].
	^ column asArray
]

{ #category : '*Cormas-UI-Roassal3' }
CMChart >> numbersOf: aSelector inInstanceData: aDataTable [
	"Return the numbers of aSelector in the data of an instance. An error names the instance"

	^ [ self numbersOf: aSelector in: aDataTable ]
		  on: CMRecordingError
		  do: [ :error |
			  CMRecordingError signal:
				  aDataTable label , ': ' , error messageText ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMChart >> plotsOf: someSeries [
	"Return, for each of someSeries that can be drawn, an association from it to the Roassal plot that draws it"

	^ self subclassResponsibility
]

{ #category : '*Cormas-UI-Roassal3' }
CMChart >> roassalChartOf: somePlots [
	"Return a Roassal chart that draws the plots of the associations somePlots, with x and y axis lines but no frame, and ticks labelled without needless decimals"

	| roassalChart xValues yValues xTicks yTicks |
	roassalChart := RSCompositeChart new.
	roassalChart extent: 800 @ 400.
	roassalChart spineDecoration: CMChartAxes new.
	title ifNotNil: [ roassalChart title: title ].
	xTitle ifNotNil: [ roassalChart xlabel: xTitle ].
	yTitle ifNotNil: [ roassalChart ylabel: yTitle ].
	somePlots do: [ :each | roassalChart add: each value ].
	somePlots ifEmpty: [ ^ roassalChart ].
	xValues := somePlots flatCollect: [ :each |
		           each value definedValuesX ].
	yValues := somePlots flatCollect: [ :each |
		           each value definedValuesY ].
	xTicks := self
		          ticksFrom: xValues min
		          to: xValues max
		          wholeNumbers:
		          (xValues allSatisfy: [ :each | each isInteger ]).
	yTicks := self
		          ticksFrom: yValues min
		          to: yValues max
		          wholeNumbers:
		          (yValues allSatisfy: [ :each | each isInteger ]).
	roassalChart
		minChartValueX: xTicks first;
		maxChartValueX: xTicks last;
		minChartValueY: yTicks first;
		maxChartValueY: yTicks last;
		xTicks: xTicks labels: (self tickLabelsOf: xTicks);
		yTicks: yTicks labels: (self tickLabelsOf: yTicks).
	^ roassalChart
]

{ #category : '*Cormas-UI-Roassal3' }
CMChart >> roassalColorFor: aSelector at: anIndex [

	^ self
		  colorFor: aSelector
		  ifNone: [ NSScale category10 range atWrap: anIndex ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMChart >> seriesOf: aRecordedObject in: aSimulation [
	"Return the series to draw, as CMChartSeries, from the data recorded in aSimulation: one for each probe of aRecordedObject, the model or an entity, then those of each probe shown for all instances of a class"

	| series |
	self checkProbesOf: aRecordedObject class.
	series := OrderedCollection new.
	subjectProbes do: [ :each |
			| data |
			data := aSimulation dataOf: aRecordedObject.
			series add: (CMChartSeries
					 named: (self labelFor: each)
					 color: (self roassalColorFor: each at: series size + 1)
					 steps: data steps asArray
					 values: (self numbersOf: each in: data)) ].
	probesOfAll do: [ :each |
			self
				addSeriesOf: each key
				ofAll: each value
				in: (aSimulation dataOfAll: each value)
				to: series ].
	^ series
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
