Extension { #name : 'CMLineChart' }

{ #category : '*Cormas-UI-Roassal3' }
CMLineChart >> canvasOf: someChartLines hiding: aSetOfNames [
	"Return a canvas with the chart of someChartLines and a legend naming each of them. The lines named in aSetOfNames are hidden. Clicking an entry of the legend hides its line, or shows it again, and updates aSetOfNames"

	| roassalChart canvas shapes legend |
	roassalChart := self roassalChartOf: someChartLines.
	roassalChart plots ifEmpty: [ canvas := RSCanvas new ] ifNotEmpty: [
			roassalChart build.
			canvas := roassalChart canvas ].
	shapes := Dictionary new.
	(someChartLines select: [ :each | each steps isNotEmpty ])
		with: roassalChart plots
		do: [ :line :plot | shapes at: line name put: plot createdShapes ].
	legend := RSLegend new.
	legend container: canvas.
	legend layout horizontal gapSize: 12.
	someChartLines do: [ :each |
			| entry drawn |
			entry := legend text: each name withBoxColor: each color.
			entry shapes first border: (RSBorder new
					 color: each color;
					 width: 1.5;
					 yourself).
			drawn := (shapes at: each name ifAbsent: [ #(  ) ])
			         , { entry shapes first }.
			entry
				when: RSMouseClick
				do: [ :event |
						(aSetOfNames includes: each name)
							ifTrue: [ aSetOfNames remove: each name ]
							ifFalse: [ aSetOfNames add: each name ].
						self color: drawn as: each hiding: aSetOfNames.
						canvas signalUpdate ]
				for: self.
			self color: drawn as: each hiding: aSetOfNames ].
	legend location below offset: 0 @ 18.
	legend build.
	^ canvas
]

{ #category : '*Cormas-UI-Roassal3' }
CMLineChart >> chartLinesOf: aRecordedObject in: aSimulation [
	"Return the lines to draw, as CMChartLines: one for each probe of aRecordedObject, the model or an entity, then one for each instance of each class whose probe is shown for all instances, from the data recorded in aSimulation"

	| chartLines data |
	self checkProbesOf: aRecordedObject class.
	data := aSimulation dataOf: aRecordedObject.
	chartLines := OrderedCollection new.
	lines do: [ :selector |
			chartLines add: (CMChartLine
					 named: (self labelFor: selector)
					 color: (self roassalColorFor: selector at: chartLines size + 1)
					 steps: data steps asArray
					 values: (self numbersOf: selector in: data)) ].
	linesOfAll do: [ :each |
			(aSimulation dataOfAll: each value) do: [ :instanceData |
					chartLines add: (CMChartLine
							 named: (self labelFor: each key) , ' of ' , instanceData label
							 color:
							 (self roassalColorFor: each key at: chartLines size + 1)
							 steps: instanceData steps asArray
							 values:
							 (self numbersOf: each key inInstanceData: instanceData)) ] ].
	^ chartLines
]

{ #category : '*Cormas-UI-Roassal3' }
CMLineChart >> check: aSelector isProbeOf: aClass [

	(aClass probeSelectors includes: aSelector) ifFalse: [
			self error:
				('#{1} is not a probe of {2}: only <probe> methods are recorded'
					 format: {
							 aSelector.
							 aClass name }) ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMLineChart >> checkProbesOf: aClass [
	"Raise an error for a line of a method that is not a probe: it can never be recorded"

	lines do: [ :each | self check: each isProbeOf: aClass ].
	linesOfAll do: [ :each | self check: each key isProbeOf: each value ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMLineChart >> color: someShapes as: aChartLine hiding: aSetOfNames [
	"Color the shapes that draw aChartLine and its legend box with its color, or make them transparent when it is hidden. The box keeps its border, so that it shows the color of a hidden line"

	| color |
	color := (aSetOfNames includes: aChartLine name)
		         ifTrue: [ Color transparent ]
		         ifFalse: [ aChartLine color ].
	someShapes do: [ :each | each color: color ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMLineChart >> numbersOf: aSelector in: aDataTable [

	| column |
	column := aDataTable column: aSelector.
	(column isEmpty or: [ column first isNumber ]) ifFalse: [
			self error:
				('A line shows numbers, but #{1} returned {2}' format: {
						 aSelector.
						 column first printString }) ].
	^ column asArray
]

{ #category : '*Cormas-UI-Roassal3' }
CMLineChart >> numbersOf: aSelector inInstanceData: aDataTable [
	"Return the numbers of aSelector in the data of an instance. An error names the instance"

	^ [ self numbersOf: aSelector in: aDataTable ]
		  on: CMRecordingError
		  do: [ :error |
			  CMRecordingError signal:
				  aDataTable label , ': ' , error messageText ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMLineChart >> roassalChartOf: someChartLines [
	"Return a Roassal chart that draws each of someChartLines that has values, with x and y axis lines but no frame, and ticks labelled without needless decimals"

	| roassalChart steps values xTicks yTicks |
	roassalChart := RSCompositeChart new.
	roassalChart extent: 800 @ 400.
	roassalChart spineDecoration: CMChartAxes new.
	title ifNotNil: [ roassalChart title: title ].
	xTitle ifNotNil: [ roassalChart xlabel: xTitle ].
	yTitle ifNotNil: [ roassalChart ylabel: yTitle ].
	someChartLines do: [ :each |
			each steps ifNotEmpty: [
					roassalChart add: ((RSLinePlot new x: each steps y: each values)
							 color: each color;
							 width: 2.5;
							 yourself) ] ].
	roassalChart plots ifEmpty: [ ^ roassalChart ].
	steps := someChartLines flatCollect: [ :each | each steps ].
	values := someChartLines flatCollect: [ :each | each values ].
	xTicks := self ticksFrom: steps min to: steps max wholeNumbers: true.
	yTicks := self
		          ticksFrom: values min
		          to: values max
		          wholeNumbers:
		          (values allSatisfy: [ :each | each isInteger ]).
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
CMLineChart >> roassalColorFor: aSelector at: anIndex [

	^ self
		  colorFor: aSelector
		  ifNone: [ NSScale category10 range atWrap: anIndex ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMLineChart >> tickLabelsOf: someTicks [
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
CMLineChart >> ticksFrom: aLowest to: aHighest wholeNumbers: aBoolean [
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
