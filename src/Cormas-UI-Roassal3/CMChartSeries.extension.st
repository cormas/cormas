Extension { #name : 'CMChartSeries' }

{ #category : '*Cormas-UI-Roassal3' }
CMChartSeries >> addSeriesDataOf: aRecordedObject in: aSimulation to: someSeriesData [
	"Add to someSeriesData those that draw me, from the data recorded in aSimulation: of aRecordedObject, the subject of the chart, or of all the instances of my class"

	self
		addSeriesDataOfTables: (showsAllInstances
				 ifTrue: [ aSimulation dataOfAll: classOfAll ]
				 ifFalse: [ { (aSimulation dataOf: aRecordedObject) } ])
		to: someSeriesData
]

{ #category : '*Cormas-UI-Roassal3' }
CMChartSeries >> addSeriesDataOfEachTable: someDataTables to: someSeriesData [
	"Add to someSeriesData one series data for each of someDataTables, named after its object"

	someDataTables do: [ :data |
			someSeriesData add: (CMSeriesData
					 of: self
					 named: data label
					 color: (self roassalColorAt: someSeriesData size + 1)
					 steps: data steps asArray
					 values: (self valuesInTable: data)) ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMChartSeries >> addSeriesDataOfTables: someDataTables to: someSeriesData [
	"Add to someSeriesData one series data gathering the rows of all someDataTables, in step order"

	| rows |
	rows := (someDataTables flatCollect: [ :data |
			         (self valuesInTable: data)
				         with: data steps asArray
				         collect: [ :value :step | step -> value ] ]) asArray.
	rows sort: [ :a :b | a key <= b key ].
	someSeriesData add: (CMSeriesData
			 of: self
			 named: label
			 color: (self roassalColorAt: someSeriesData size + 1)
			 steps: (rows collect: [ :each | each key ])
			 values: (rows collect: [ :each | each value ]))
]

{ #category : '*Cormas-UI-Roassal3' }
CMChartSeries >> checkIsProbeOf: aSubjectClass [
	"Raise an error when one of the methods I show is neither a probe of the class whose objects I show, aSubjectClass when I show the subject of the chart, nor currentTimeStep: it can never be recorded"

	| shownClass |
	shownClass := showsAllInstances
		              ifTrue: [ classOfAll ]
		              ifFalse: [ aSubjectClass ].
	self probes do: [ :each |
			(each = #currentTimeStep or: [
				 shownClass probeSelectors includes: each ]) ifFalse: [
					self error:
						('#{1} is not a probe of {2}: only <probe> methods and currentTimeStep are recorded'
							 format: {
									 each.
									 shownClass name }) ] ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMChartSeries >> numbersOf: aSelector in: aDataTable [

	| column |
	column := self valuesOf: aSelector in: aDataTable.
	(column isEmpty or: [ column first isNumber ]) ifFalse: [
			self error:
				('The chart shows numbers, but #{1} returned {2}' format: {
						 aSelector.
						 column first printString }) ].
	^ column
]

{ #category : '*Cormas-UI-Roassal3' }
CMChartSeries >> place: someValues in: someCategories [
	"Return someValues, the rows I draw, with each value on x replaced by the position of its category on the x axis"

	^ self subclassResponsibility
]

{ #category : '*Cormas-UI-Roassal3' }
CMChartSeries class >> plotsOf: someSeriesData on: aChart [
	"Return, for each of someSeriesData, all drawn by series of my kind, an association from it to the Roassal plot that draws it. aChart chooses the ticks"

	^ self subclassResponsibility
]

{ #category : '*Cormas-UI-Roassal3' }
CMChartSeries >> roassalColorAt: anIndex [
	"My color, or else the color of the chart's palette for the series at anIndex"

	^ (colors ifEmpty: [ CMColor palette ]) atWrap: anIndex
]

{ #category : '*Cormas-UI-Roassal3' }
CMChartSeries >> valuesIn: aDataTable [
	"Return what I draw at each row of aDataTable"

	^ self subclassResponsibility
]

{ #category : '*Cormas-UI-Roassal3' }
CMChartSeries >> valuesInTable: aDataTable [
	"Return what I draw at each row of aDataTable. When I show all the instances of a class, an error names the instance"

	showsAllInstances ifFalse: [ ^ self valuesIn: aDataTable ].
	^ [ self valuesIn: aDataTable ]
		  on: CMRecordingError
		  do: [ :error |
			  CMRecordingError signal:
				  aDataTable label , ': ' , error messageText ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMChartSeries >> valuesOf: aSelector in: aDataTable [
	"Return the value of the method aSelector at each row of aDataTable: its column, or for currentTimeStep, which every model and entity understands, the step of the row"

	aSelector = #currentTimeStep ifTrue: [ ^ aDataTable steps asArray ].
	^ (aDataTable column: aSelector) asArray
]

{ #category : '*Cormas-UI-Roassal3' }
CMChartSeries class >> xMargin [
	"The space my marks need on each side of the x axis, beyond its first and last ticks"

	^ 0
]

{ #category : '*Cormas-UI-Roassal3' }
CMChartSeries >> xValuesOf: someValues [
	"Return the value on x of each of someValues, the rows I draw"

	^ self subclassResponsibility
]
