Class {
	#name : 'CMStackedSeriesRoassalTest',
	#superclass : 'TestCase',
	#instVars : [
		'simulation',
		'model',
		'chart'
	],
	#category : 'Cormas-UI-Tests',
	#package : 'Cormas-UI-Tests'
}

{ #category : 'testing' }
CMStackedSeriesRoassalTest class >> isAbstract [

	^ self == CMStackedSeriesRoassalTest
]

{ #category : 'helpers' }
CMStackedSeriesRoassalTest >> flowsDrawnBy: aClass [
	"An inflow, then two outflows, as recorded at steps 0 and 1"

	^ #( #inflow #outflow #loss ) with: { 
			  { (0 @ 3). (1 @ 2) }.
			  { (0 @ -1). (1 @ -4) }.
			  { (0 @ -2). (1 @ -1) } } collect: [ :probe :points |
		  CMSeriesData
			  of: (aClass new x: #currentTimeStep y: probe)
			  named: probe
			  color: Color blue
			  steps: #( 0 1 )
			  values: points ]
]

{ #category : 'running' }
CMStackedSeriesRoassalTest >> setUp [

	super setUp.
	simulation := (CMSimulation for: CMMockModel new)
		              randomSeed: 41;
		              activeInitSelector: #initFixed;
		              activeControlSelector: #step;
		              initializeSimulation;
		              yourself.
	3 timesRepeat: [ simulation runStep ].
	model := simulation cormasModel.
	chart := CMChart new
]
