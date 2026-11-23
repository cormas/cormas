"
I am the bars of a `CMHistogram`: the distribution of a probe over all the instances of a class at one step.

## Responsibility:

- I show my probe, which must return numbers, of all the instances of a class and of its subclasses.

## Collaborators:

- `CMSpreadSeries` makes my series; the histogram counts them in bins.

## Public API and Key Messages

- `probe:ofAll:`, `label:`, `color:`

```smalltalk
(CMBarSeries new probe: #energy ofAll: CMMockAnimal)
	label: 'Energy';
	yourself
```
"
Class {
	#name : 'CMBarSeries',
	#superclass : 'CMSpreadSeries',
	#category : 'Cormas-Core-Charts',
	#package : 'Cormas-Core',
	#tag : 'Charts'
}
