Class {
	#name : 'CMRangeSamplingMethodTest',
	#superclass : 'TestCase',
	#instVars : [
		'generator'
	],
	#category : 'Cormas-UI-Tests',
	#package : 'Cormas-UI-Tests'
}

{ #category : 'running' }
CMRangeSamplingMethodTest >> setUp [

	super setUp.
	generator := CMRangeSamplingMethod new.
]

{ #category : 'tests' }
CMRangeSamplingMethodTest >> testDefaultLowValue [

	self assert: generator lowValue equals: 0
]

{ #category : 'tests' }
CMRangeSamplingMethodTest >> testGenerate [

	| expected |
	
	generator
		lowValue: 20;
		highValue: 100;
		step: 20.
		
	expected := #(20 40 60 80 100).
	
	self assert: generator generate equals: expected.
]

{ #category : 'tests' }
CMRangeSamplingMethodTest >> testGenerateFloats [

	| expected |
	
	generator
		lowValue: 0;
		highValue: 1;
		step: 0.1.
	
	expected := #(0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1).
	
	self assert: generator generate closeTo: expected precision: 0.00000000001.
]

{ #category : 'tests' }
CMRangeSamplingMethodTest >> testLowValueHighValueAndStepSetNumberOfValues [

	generator
		lowValue: 30;
		highValue: 130;
		step: 20.
		
	self assert: generator numberOfValues equals: 6 
]

{ #category : 'tests' }
CMRangeSamplingMethodTest >> testRejectsInvalidNumberOfValues [

	self should: [ generator numberOfValues: -1 ] raise: Error.
	self should: [ generator numberOfValues: 0.5 ] raise: Error.
]
