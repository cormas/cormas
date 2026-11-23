"
I am points: one point for each recorded row of a probe on y against a probe on x.

## Responsibility:

- For the subject of the chart, I make a point for each recorded step; for all the instances of a class, a point for each instance and recorded step, gathered in one series named after my label.
- After `atShownStep`, I show only the points of the step the chart shows, such as one point per instance.
- My points are large and translucent, so that the points behind others show.

## Collaborators:

- `CMXYSeries` gives me my probes, label and color; `CMPointsPlot` draws me.

## Public API and Key Messages

- `x:y:`, `x:y:ofAll:`, `label:`, `color:`, `atShownStep`

```smalltalk
CMPointSeries new
	x: #age y: #energy ofAll: RMRabbit;
	atShownStep;
	color: Color gray;
	yourself
```
"
Class {
	#name : 'CMPointSeries',
	#superclass : 'CMXYSeries',
	#category : 'Cormas-Core-Charts',
	#package : 'Cormas-Core',
	#tag : 'Charts'
}
