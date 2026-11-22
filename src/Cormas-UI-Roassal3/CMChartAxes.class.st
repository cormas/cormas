"
I draw the x and y axis lines of a chart, without a frame around it.

## Responsibility:

- Draw the x axis along the bottom of the chart and the y axis along its left side, whatever the values: Roassal's line axes cross at zero instead.

## Collaborators:

- `CMLineChart>>roassalChartOf:` gives me to its Roassal chart as its spine decoration.
- `RSLineSpineDecoration`: my superclass, which draws the two lines.

## Public API and Key Messages

- `aRoassalChart spineDecoration: CMChartAxes new`

```smalltalk
| chart |
chart := RSCompositeChart new.
chart spineDecoration: CMChartAxes new.
chart add: (RSLinePlot new x: #(0 1 2) y: #(5 3 4)).
chart open
```
"
Class {
	#name : 'CMChartAxes',
	#superclass : 'RSLineSpineDecoration',
	#category : 'Cormas-UI-Roassal3',
	#package : 'Cormas-UI-Roassal3'
}

{ #category : 'accessing' }
CMChartAxes >> zeroPoint [
	"The bottom left corner of the chart, where my axes cross, whatever the values"

	^ 0 @ self chart extent y
]
