Extension { #name : 'CMChartSeries' }

{ #category : '*Cormas-UI-Roassal3' }
CMChartSeries >> addSeriesDataOf: aRecordedObject in: aSimulation to: someSeries [
	"Add to someSeries those that draw me, from the data recorded in aSimulation: of aRecordedObject, the subject of the chart, or of all the instances of my class"

	| data |
	classOfAll ifNotNil: [
			^ self
				  addSeriesDataOfAll: (aSimulation dataOfAll: classOfAll)
				  to: someSeries ].
	data := aSimulation dataOf: aRecordedObject.
	someSeries add: (CMSeriesData
			 named: label
			 color: (self roassalColorAt: someSeries size + 1)
			 steps: data steps asArray
			 values: (self numbersIn: data))
]

{ #category : '*Cormas-UI-Roassal3' }
CMChartSeries >> addSeriesDataOfAll: someDataTables to: someSeries [
	"Add to someSeries those that draw me from the data tables of all the instances of my class"

	self subclassResponsibility
]

{ #category : '*Cormas-UI-Roassal3' }
CMChartSeries >> addSeriesDataOfEachInstanceIn: someDataTables to: someSeries [
	"Add to someSeries one series for each instance, named after my label and the instance"

	someDataTables do: [ :data |
			someSeries add: (CMSeriesData
					 named: label , ' of ' , data label
					 color: (self roassalColorAt: someSeries size + 1)
					 steps: data steps asArray
					 values: (self numbersInInstanceData: data)) ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMChartSeries >> checkIsProbeOf: aSubjectClass [
	"Raise an error when my probe is not a probe of the class whose objects I show, aSubjectClass when I show the subject of the chart: it can never be recorded"

	| shownClass |
	shownClass := classOfAll ifNil: [ aSubjectClass ].
	(shownClass probeSelectors includes: probe) ifFalse: [
			self error:
				('#{1} is not a probe of {2}: only <probe> methods are recorded'
					 format: {
							 probe.
							 shownClass name }) ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMChartSeries >> numbersIn: aDataTable [

	| column |
	column := aDataTable column: probe.
	(column isEmpty or: [ column first isNumber ]) ifFalse: [
			self error:
				('The chart shows numbers, but #{1} returned {2}' format: {
						 probe.
						 column first printString }) ].
	^ column asArray
]

{ #category : '*Cormas-UI-Roassal3' }
CMChartSeries >> numbersInInstanceData: aDataTable [
	"Return the numbers of my probe in the data of an instance. An error names the instance"

	^ [ self numbersIn: aDataTable ]
		  on: CMRecordingError
		  do: [ :error |
			  CMRecordingError signal:
				  aDataTable label , ': ' , error messageText ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMChartSeries >> roassalColorAt: anIndex [
	"My color, or else the color of the chart's palette for the series at anIndex"

	^ color ifNil: [ NSScale category10 range atWrap: anIndex ]
]
