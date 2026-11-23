"
I am a series that shows how a probe is spread over all the instances of a class. I am the abstract superclass of `CMBoxSeries` and `CMBarSeries`.

## Responsibility:

- I make one series whose value at each step is the collection of the values of my probe of the instances recorded at that step.
- I only show `probe:ofAll:`: there is no spread over the subject of a chart alone.

## Collaborators:

- `CMChartSeries` gives me my probe, label and color.
- My chart, a `CMBoxplot` or a `CMHistogram`, plots my series.

## Public API and Key Messages

- `probe:ofAll:`, `label:`, `color:`
"
Class {
	#name : 'CMSpreadSeries',
	#superclass : 'CMChartSeries',
	#category : 'Cormas-Core-Charts',
	#package : 'Cormas-Core',
	#tag : 'Charts'
}

{ #category : 'configuring' }
CMSpreadSeries >> probe: aSelector [
	^ self error:
		  ('{1} shows the spread over all the instances of a class: send it probe:ofAll:'
			   format: { self class name })
]
