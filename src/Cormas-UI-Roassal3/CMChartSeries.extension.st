Extension { #name : 'CMChartSeries' }

{ #category : '*Cormas-UI-Roassal3' }
CMChartSeries >> addSeriesDataGatheringEachStepOf: someDataTables to: someSeries [
	"Add to someSeries one series whose value at each step is the collection of what I draw for the instances recorded at that step"

	| gathered steps |
	gathered := Dictionary new.
	someDataTables do: [ :data |
			(self valuesInInstanceData: data)
				with: data steps
				do: [ :value :step |
					(gathered at: step ifAbsentPut: [ OrderedCollection new ]) add:
						value ] ].
	steps := gathered keys sorted asArray.
	someSeries add: (CMSeriesData
			 named: label
			 color: (self roassalColorAt: someSeries size + 1)
			 steps: steps
			 values: (steps collect: [ :each | (gathered at: each) asArray ]))
]

{ #category : '*Cormas-UI-Roassal3' }
CMChartSeries >> addSeriesDataOf: aRecordedObject in: aSimulation to: someSeries [
	"Add to someSeries those that draw me, from the data recorded in aSimulation: of aRecordedObject, the subject of the chart, or of all the instances of my class"

	| data |
	showsAllInstances ifTrue: [
			^ self
				  addSeriesDataOfAll: (aSimulation dataOfAll: classOfAll)
				  to: someSeries ].
	data := aSimulation dataOf: aRecordedObject.
	someSeries add: (CMSeriesData
			 named: label
			 color: (self roassalColorAt: someSeries size + 1)
			 steps: data steps asArray
			 values: (self valuesIn: data))
]

{ #category : '*Cormas-UI-Roassal3' }
CMChartSeries >> addSeriesDataOfAll: someDataTables to: someSeries [
	"Add to someSeries those that draw me from the data tables of all the instances of my class"

	self subclassResponsibility
]

{ #category : '*Cormas-UI-Roassal3' }
CMChartSeries >> addSeriesDataOfEachInstanceIn: someDataTables to: someSeries [
	"Add to someSeries one series for each instance, named after the instance"

	someDataTables do: [ :data |
			someSeries add: (CMSeriesData
					 named: data label
					 color: (self roassalColorAt: someSeries size + 1)
					 steps: data steps asArray
					 values: (self valuesInInstanceData: data)) ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMChartSeries >> checkIsProbeOf: aSubjectClass [
	"Raise an error when one of my probes is not a probe of the class whose objects I show, aSubjectClass when I show the subject of the chart: it can never be recorded"

	| shownClass |
	shownClass := showsAllInstances
		              ifTrue: [ classOfAll ]
		              ifFalse: [ aSubjectClass ].
	self probes do: [ :each |
			(shownClass probeSelectors includes: each) ifFalse: [
					self error:
						('#{1} is not a probe of {2}: only <probe> methods are recorded'
							 format: {
									 each.
									 shownClass name }) ] ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMChartSeries >> numbersOf: aSelector in: aDataTable [

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
CMChartSeries >> roassalColorAt: anIndex [
	"My color, or else the color of the chart's palette for the series at anIndex"
	^ (colors ifEmpty: [ NSScale category10 range ]) atWrap: anIndex
]

{ #category : '*Cormas-UI-Roassal3' }
CMChartSeries >> valuesIn: aDataTable [
	"Return what I draw at each step of aDataTable: the numbers of my probe"

	^ self numbersOf: probe in: aDataTable
]

{ #category : '*Cormas-UI-Roassal3' }
CMChartSeries >> valuesInInstanceData: aDataTable [
	"Return what I draw at each step of the data of an instance. An error names the instance"

	^ [ self valuesIn: aDataTable ]
		  on: CMRecordingError
		  do: [ :error |
			  CMRecordingError signal:
				  aDataTable label , ': ' , error messageText ]
]
