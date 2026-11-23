"
I am an area, stacked on the areas of the chart before me, or below them where my values are negative. My height at each value on x is the sum of my values on y there.

## Responsibility:

- I join my stacks at the values on x into one area, which suits values that change continuously, such as the size of a population over time.
- I show the subject of the chart or all the instances of a class, and count the instances in each category, as `CMStackedSeries` does.

## Collaborators:

- `CMStackedSeries` gives me my probes, label, color, categories and stacking; `RSAreaPlot` draws me.

## Public API and Key Messages

- `x:y:`, `x:y:ofAll:`, `label:`, `color:`, `atShownStep`
- `category:label:`, `category:color:` and `category:label:color:` name and color the area of a value.

```smalltalk
CMAreaSeries new
	x: #currentTimeStep y: #state ofAll: CMMockCell;
	category: #alive label: 'Alive' color: Color green;
	yourself
```
"
Class {
	#name : 'CMAreaSeries',
	#superclass : 'CMStackedSeries',
	#category : 'Cormas-Core-Charts',
	#package : 'Cormas-Core',
	#tag : 'Charts'
}
