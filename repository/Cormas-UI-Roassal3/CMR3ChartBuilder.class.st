Class {
	#name : 'CMR3ChartBuilder',
	#superclass : 'Object',
	#instVars : [
		'chart'
	],
	#category : 'Cormas-UI-Roassal3-Space',
	#package : 'Cormas-UI-Roassal3',
	#tag : 'Space'
}

{ #category : 'examples' }
CMR3ChartBuilder class >> example [

	<example>
	| builder |

	builder := self new
		asPresenter.
	
	builder open.
]

{ #category : 'adding' }
CMR3ChartBuilder >> addPlotX: xCollection y: yCollection color: aColor [

	| plot |
	plot := RSLinePlot new x: xCollection y: yCollection.
	plot color: aColor.
	plot width: 2.5.
		
	chart add: plot.
]

{ #category : 'accessing' }
CMR3ChartBuilder >> chart [

	^ chart
]

{ #category : 'as yet unclassified' }
CMR3ChartBuilder >> clearChart [

	chart plots removeAll
]

{ #category : 'initialization' }
CMR3ChartBuilder >> initialize [

	super initialize.
	self initializeChart
]

{ #category : 'initialization' }
CMR3ChartBuilder >> initializeChart [

	| spine |
	chart := RSCompositeChart new.
	chart extent: 800 @ 400.
	chart spineDecoration: (spine := RSLineSpineDecoration new).
	spine shape format: '^'.
	chart padding: 0.
]

{ #category : 'accessing' }
CMR3ChartBuilder >> maxChartValueX: aNumber [

	chart maxChartValueX: aNumber 
]
