"
I am one line of a chart, ready to draw: a name, a color, and the values of a probe at the steps they were recorded.

## Responsibility:

- I know my name, shown in the legend, and by which I am hidden.
- I know my color.
- I know my steps and my values, of the same size.

## Collaborators:

- `CMLineChart>>chartLinesOf:in:` creates me from recorded data.
- `CMLineChart>>canvasOf:hiding:` draws me, and hides me by my name.

## Public API and Key Messages

- `CMChartLine named:color:steps:values:` creates me.
- `name`, `color`, `steps` and `values` return what I know.

```smalltalk
CMChartLine
	named: 'boars'
	color: Color brown
	steps: #( 0 1 2 )
	values: #( 40 38 41 )
```
"
Class {
	#name : 'CMChartLine',
	#superclass : 'Object',
	#instVars : [
		'name',
		'color',
		'steps',
		'values'
	],
	#category : 'Cormas-UI-Roassal3',
	#package : 'Cormas-UI-Roassal3'
}

{ #category : 'instance creation' }
CMChartLine class >> named: aString color: aColor steps: someSteps values: someValues [

	^ self new
		  setName: aString
		  color: aColor
		  steps: someSteps
		  values: someValues;
		  yourself
]

{ #category : 'accessing' }
CMChartLine >> color [

	^ color
]

{ #category : 'accessing' }
CMChartLine >> name [

	^ name
]

{ #category : 'accessing' }
CMChartLine >> setName: aString color: aColor steps: someSteps values: someValues [

	name := aString.
	color := aColor.
	steps := someSteps.
	values := someValues
]

{ #category : 'accessing' }
CMChartLine >> steps [

	^ steps
]

{ #category : 'accessing' }
CMChartLine >> values [

	^ values
]
