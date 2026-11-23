"
I test how the views of a `CMSensitivityAnalysis` of `CMMockModel` are drawn with Roassal from its results.
"
Class {
	#name : 'CMSensitivityAnalysisRoassalTest',
	#superclass : 'TestCase',
	#instVars : [
		'analysis',
		'output'
	],
	#category : 'Cormas-UI-Tests',
	#package : 'Cormas-UI-Tests'
}

{ #category : 'tests' }
CMSensitivityAnalysisRoassalTest >> huesOfPointsIn: aCanvas [

	^ ((aCanvas allChildren select: [ :each | each isKindOf: RSEllipse ])
		   collect: [ :each | each color hue rounded ]) asSet
]

{ #category : 'tests' }
CMSensitivityAnalysisRoassalTest >> setUp [

	super setUp.
	analysis := (CMSensitivityAnalysis on:
			             ((CMSimulation for: CMMockModel new)
				              activeInitSelector: #init;
				              activeControlSelector: #step;
				              stopAfterStep: 2;
				              yourself))
		            masterSeed: 42;
		            parameter: #initialNumberOfCows
		            of: CMMockModel
		            values: #( 1 2 );
		            parameter: #initialNumberOfGoats
		            of: CMMockModel
		            values: #( 4 5 );
		            replicates: 2;
		            yourself.
	output := FileSystem memory / 'output'
]

{ #category : 'tests' }
CMSensitivityAnalysisRoassalTest >> testAGroupingByCategoriesColorsThePointsInDistinctColors [

	| canvas |
	analysis
		parameter: #weather
		of: CMMockModel
		values: #( #sunny #rainy ).
	analysis run.
	canvas := analysis
		          canvasOf: 'numberOfAliveCells'
		          against: 'initialNumberOfCows'
		          groupedBy: 'weather'.
	self assert: (self huesOfPointsIn: canvas) size equals: 2
]

{ #category : 'tests' }
CMSensitivityAnalysisRoassalTest >> testAGroupingByNumbersColorsThePointsInShadesOfOneColor [

	| canvas colors |
	analysis run.
	canvas := analysis
		          canvasOf: 'numberOfAliveCells'
		          against: 'initialNumberOfCows'
		          groupedBy: 'initialNumberOfGoats'.
	colors := ((canvas allChildren select: [ :each |
		            each isKindOf: RSEllipse ]) collect: [ :each |
		           each color ]) asSet.
	self assert: colors size equals: 2.
	self assert: (self huesOfPointsIn: canvas) size equals: 1
]

{ #category : 'tests' }
CMSensitivityAnalysisRoassalTest >> testAParameterWhoseValuesAreNotNumbersIsShownInCategories [

	| texts |
	analysis
		parameter: #weather
		of: CMMockModel
		values: #( #sunny #rainy ).
	analysis run.
	texts := self textsOf:
		         (analysis canvasOf: 'numberOfAliveCells' against: 'weather').
	self assert: (texts includesAll: #( 'sunny' 'rainy' ))
]

{ #category : 'tests' }
CMSensitivityAnalysisRoassalTest >> testAnOutputAgainstAParameterGroupedByAnotherNamesEachValueOfTheOther [

	| texts |
	analysis run.
	texts := self textsOf: (analysis
			          canvasOf: 'numberOfAliveCells'
			          against: 'initialNumberOfCows'
			          groupedBy: 'initialNumberOfGoats').
	self assert: (texts includesAll:
			 #( 'initialNumberOfGoats = 4' 'initialNumberOfGoats = 5' ))
]

{ #category : 'tests' }
CMSensitivityAnalysisRoassalTest >> testAnOutputAgainstAParameterHasNoLegend [

	| texts |
	analysis run.
	texts := self textsOf: (analysis
			          canvasOf: 'numberOfAliveCells'
			          against: 'initialNumberOfCows').
	self
		assert: (texts count: [ :each | each = 'numberOfAliveCells' ])
		equals: 1
]

{ #category : 'tests' }
CMSensitivityAnalysisRoassalTest >> testAnOutputAgainstAParameterIsAPointForEachRun [

	| canvas |
	analysis run.
	canvas := analysis
		          canvasOf: 'numberOfAliveCells'
		          against: 'initialNumberOfCows'.
	self
		assert:
		(canvas allChildren count: [ :each | each isKindOf: RSEllipse ])
		equals: analysis numberOfRuns.
	self assert: ((self textsOf: canvas) includesAll:
			 #( 'numberOfAliveCells' 'initialNumberOfCows' ))
]

{ #category : 'tests' }
CMSensitivityAnalysisRoassalTest >> textsOf: aCanvas [

	^ (aCanvas allChildren select: [ :each | each isKindOf: RSLabel ])
		  collect: [ :each | each text ]
]
