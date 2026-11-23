"
I am the ticks of the x axis of a Cormas chart. Unlike `RSHorizontalTick`, I do not stretch the x axis from my first tick to my last one: the chart chooses its x range, and I only mark and label the values in it.

## Responsibility:

- Mark and label the chosen values of the x axis.
- Leave the x range of the chart as the chart set it, so that it can end at the last value instead of the next tick.

## Collaborators:

- `CMChart`: adds me to its Roassal chart, sets its x range and gives me my ticks.

## Public API and Key Messages

- `ticks:labels:`, inherited

```
roassalChart
	addDecoration: CMChartXTicks new;
	xTicks: #( 0 5 10 ) labels: #( '0' '5' '10' );
	maxChartValueX: 14
```
"
Class {
	#name : 'CMChartXTicks',
	#superclass : 'RSHorizontalTick',
	#category : 'Cormas-UI-Roassal3',
	#package : 'Cormas-UI-Roassal3'
}

{ #category : 'rendering' }
CMChartXTicks >> updateChartMaxAndMinValues: aChart [
	"Keep the x range that the chart chose"
]
