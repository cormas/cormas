"
I am the boxes of a `CMBoxplot`: the spread of a probe over all the instances of a class, one box at each step.

## Responsibility:

- I show my probe, which must return numbers, of all the instances of a class and of its subclasses.

## Collaborators:

- `CMSpreadSeries` makes my series; `CMBoxesPlot` draws them.

## Public API and Key Messages

- `probe:ofAll:`, `label:`, `color:`

```smalltalk
(CMBoxSeries probe: #energy ofAll: CMMockAnimal)
	color: Color orange;
	yourself
```
"
Class {
	#name : 'CMBoxSeries',
	#superclass : 'CMSpreadSeries',
	#category : 'Cormas-Core-Charts',
	#package : 'Cormas-Core',
	#tag : 'Charts'
}
