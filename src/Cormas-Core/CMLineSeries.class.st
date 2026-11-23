"
I am a line: the points of a probe on y against a probe on x, joined in the order of their steps. Against `#currentTimeStep`, I show how the probe changes over time; against another probe, how the two change together.

## Responsibility:

- For the subject of the chart, I make one line.
- For all the instances of a class, I make one line for each instance, named after the instance.

## Collaborators:

- `CMXYSeries` gives me my probes, label and color; `RSLinePlot` draws me.

## Public API and Key Messages

- `x:y:`, `x:y:ofAll:`, `label:`, `color:`, `atShownStep`

```smalltalk
CMLineSeries new
	x: #currentTimeStep y: #energy ofAll: CMMockAnimal;
	color: Color gray;
	yourself
```
"
Class {
	#name : 'CMLineSeries',
	#superclass : 'CMXYSeries',
	#category : 'Cormas-Core-Charts',
	#package : 'Cormas-Core',
	#tag : 'Charts'
}
