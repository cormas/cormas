"
I am an area of a `CMAreaChart`, stacked on the areas before me.

## Responsibility:

- For the subject of the chart, I make one series of my probe, which must return numbers.
- For all the instances of a class, I make one series for each instance when my probe returns numbers, or else one for each of its values, counting the instances that have it.

## Collaborators:

- `CMChartSeries` gives me my probe, label and color.

## Public API and Key Messages

- `probe:`, `probe:ofAll:`, `label:`, `color:`

```smalltalk
(CMAreaSeries probe: #state ofAll: CMMockCell)
	label: 'Cells';
	yourself
```
"
Class {
	#name : 'CMAreaSeries',
	#superclass : 'CMChartSeries',
	#category : 'Cormas-Core-Charts',
	#package : 'Cormas-Core',
	#tag : 'Charts'
}
