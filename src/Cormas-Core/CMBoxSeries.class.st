"
I am boxes: the spread of a probe on y, one box for each value of a probe on x, such as a box at each step for the energy of all the rabbits.

## Responsibility:

- I gather the values on y of all the objects I show at each value on x; my probe on y must return numbers.
- Several box series of a chart stand side by side at each value on x.

## Collaborators:

- `CMXYSeries` gives me my probes, label and color; `CMBoxesPlot` draws me.

## Public API and Key Messages

- `x:y:ofAll:`, `x:y:`, `label:`, `color:`, `atShownStep`

```smalltalk
CMBoxSeries new
	x: #currentTimeStep y: #energy ofAll: CMMockAnimal;
	color: Color orange;
	yourself
```
"
Class {
	#name : 'CMBoxSeries',
	#superclass : 'CMXYSeries',
	#category : 'Cormas-Core-Charts',
	#package : 'Cormas-Core',
	#tag : 'Charts'
}
