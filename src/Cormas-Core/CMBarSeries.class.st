"
I am bars, one at each value on x, stacked on the bars of the chart before me, or below them where my values are negative. The height of a bar is the sum of my values on y at its value on x.

## Responsibility:

- I suit amounts that belong to one step or one category, such as the meals eaten each day, or an inflow above zero and an outflow below it.
- I show the subject of the chart or all the instances of a class, and count the instances in each category, as `CMStackedSeries` does.

## Collaborators:

- `CMStackedSeries` gives me my probes, label, color, categories and stacking; `CMBarsPlot` draws me.

## Public API and Key Messages

- `x:y:`, `x:y:ofAll:`, `label:`, `color:`, `atShownStep`
- `CMChart>>barsX:y:` and `CMChart>>barsX:y:ofAll:` add me with the default label and color.

A water balance, whose `evaporation` probe returns negative numbers, with its stock as a line over the bars:

```smalltalk
CMChart new
	title: 'Water';
	barsX: #currentTimeStep y: #rain;
	barsX: #currentTimeStep y: #irrigation;
	barsX: #currentTimeStep y: #evaporation;
	lineX: #currentTimeStep y: #stock;
	yourself
```
"
Class {
	#name : 'CMBarSeries',
	#superclass : 'CMStackedSeries',
	#category : 'Cormas-Core-Charts',
	#package : 'Cormas-Core',
	#tag : 'Charts'
}
