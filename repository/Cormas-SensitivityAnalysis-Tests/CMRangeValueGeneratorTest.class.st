Class {
	#name : 'CMRangeValueGeneratorTest',
	#superclass : 'TestCase',
	#instVars : [
		'generator',
		'lowValue',
		'highValue',
		'step',
		'numberOfValues'
	],
	#category : 'Cormas-SensitivityAnalysis-Tests',
	#package : 'Cormas-SensitivityAnalysis-Tests'
}

{ #category : 'running' }
CMRangeValueGeneratorTest >> setUp [

	super setUp.
	generator := CMRangeValueGenerator new.
	
	lowValue := 1.
	highValue := 101.
	step := 20.
	numberOfValues := 5.
]

{ #category : 'tests' }
CMRangeValueGeneratorTest >> testDefaultLowValue [

	self assert: generator lowValue equals: 0
]

{ #category : 'tests' }
CMRangeValueGeneratorTest >> testFromToNumberOfValues [

	generator
		lowValue: lowValue;
		highValue: highValue;
		numberOfValues: numberOfValues.
		
	self assert: generator step equals: step 
]

{ #category : 'tests' }
CMRangeValueGeneratorTest >> testFromToStep [

	generator
		lowValue: lowValue;
		highValue: highValue;
		step: step.
		
	self assert: generator numberOfValues equals: numberOfValues 
]

{ #category : 'tests' }
CMRangeValueGeneratorTest >> testGenerate [

	| expected |
	
	generator
		lowValue: lowValue;
		highValue: highValue;
		step: step.
		
	expected := #(1 21 41 61 81).
	
	self assert: generator generate equals: expected.
]

{ #category : 'tests' }
CMRangeValueGeneratorTest >> testGenerateFloats [

	| expected |
	
	generator
		lowValue: 0;
		highValue: 1;
		step: 0.1.
	
	expected := #(0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9).
	
	self assert: generator generate closeTo: expected precision: 0.00000000001.
]

{ #category : 'tests' }
CMRangeValueGeneratorTest >> testRejectsInvalidNumberOfValues [

	self should: [ generator numberOfValues: -1 ] raise: Error.
	self should: [ generator numberOfValues: 0.5 ] raise: Error.
]
