Class {
	#name : 'CMRangeValueGeneratorTest',
	#superclass : 'TestCase',
	#instVars : [
		'generator'
	],
	#category : 'Cormas-SensitivityAnalysis-Tests',
	#package : 'Cormas-SensitivityAnalysis-Tests'
}

{ #category : 'running' }
CMRangeValueGeneratorTest >> setUp [

	super setUp.
	generator := CMRangeValueGenerator new.
]

{ #category : 'tests' }
CMRangeValueGeneratorTest >> testDefaultLowValue [

	self assert: generator lowValue equals: 0
]

{ #category : 'tests' }
CMRangeValueGeneratorTest >> testGenerate [

	| expected |
	
	generator
		lowValue: 20;
		highValue: 120;
		step: 20.
		
	expected := #(20 40 60 80 100).
	
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
CMRangeValueGeneratorTest >> testHighValueStepAndLowValueSetNumberOfValues [

	generator
		highValue: 130;
		step: 20;
		lowValue: 30.
		
	self assert: generator numberOfValues equals: 5 
]

{ #category : 'tests' }
CMRangeValueGeneratorTest >> testLowValueHighValueAndNumberOfValuesSetStep [

	generator
		lowValue: 30;
		highValue: 130;
		numberOfValues: 5.
		
	self assert: generator step equals: 20 
]

{ #category : 'tests' }
CMRangeValueGeneratorTest >> testLowValueHighValueAndStepSetNumberOfValues [

	generator
		lowValue: 30;
		highValue: 130;
		step: 20.
		
	self assert: generator numberOfValues equals: 5 
]

{ #category : 'tests' }
CMRangeValueGeneratorTest >> testLowValueStepAndHighValueSetNumberOfValues [

	generator
		lowValue: 30;
		step: 20;
		highValue: 130.
		
	self assert: generator numberOfValues equals: 5 
]

{ #category : 'tests' }
CMRangeValueGeneratorTest >> testRejectsInvalidNumberOfValues [

	self should: [ generator numberOfValues: -1 ] raise: Error.
	self should: [ generator numberOfValues: 0.5 ] raise: Error.
]
