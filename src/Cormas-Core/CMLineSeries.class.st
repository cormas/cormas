"
I am a line of a `CMLineChart`: the values of a probe over time, of the subject of the chart, or of each instance of a class, one line each.

## Responsibility:

- I make one series for my probe of the subject of the chart, or one for each instance, named after the instance.
- My probe must return numbers.

## Collaborators:

- `CMChartSeries` gives me my probe, label and color.

## Public API and Key Messages

- `probe:`, `probe:ofAll:`, `label:`, `color:`

```smalltalk
(CMLineSeries new probe: #energy ofAll: CMMockAnimal)
	color: Color gray;
	yourself
```
"
Class {
	#name : 'CMLineSeries',
	#superclass : 'CMChartSeries',
	#category : 'Cormas-Core-Charts',
	#package : 'Cormas-Core',
	#tag : 'Charts'
}
