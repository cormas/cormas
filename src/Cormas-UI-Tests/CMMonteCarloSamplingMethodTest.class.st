Class {
	#name : 'CMMonteCarloSamplingMethodTest',
	#superclass : 'TestCase',
	#instVars : [
		'generator',
		'lowValue',
		'highValue',
		'numberOfValues'
	],
	#category : 'Cormas-UI-Tests',
	#package : 'Cormas-UI-Tests'
}

{ #category : 'running' }
CMMonteCarloSamplingMethodTest >> setUp [

	super setUp.
	generator := CMMonteCarloSamplingMethod new.
	
	lowValue := 10.
	highValue := 50.
	numberOfValues := 10.
	
	generator
		lowValue: lowValue;
		highValue: highValue;
		numberOfValues: numberOfValues.
]

{ #category : 'tests' }
CMMonteCarloSamplingMethodTest >> testGenerate [

	| numbers |
	numbers := generator generate.
		
	self assert: numbers size equals: numberOfValues.
	self assert: (numbers allSatisfy: [ :each | each >= lowValue ]).
	self assert: (numbers allSatisfy: [ :each | each <= highValue ]).
	self assert: (numbers allSatisfy: [ :each | each isFloat ]).
]

{ #category : 'tests' }
CMMonteCarloSamplingMethodTest >> testGenerateIntegers [

	| numbers |
	generator isInteger: true.
	numbers := generator generate.
		
	self assert: numbers size equals: numberOfValues.
	self assert: (numbers allSatisfy: [ :each | each >= lowValue ]).
	self assert: (numbers allSatisfy: [ :each | each <= highValue ]).
	self assert: (numbers allSatisfy: [ :each | each isInteger ]).
]

{ #category : 'accessing' }
CMMonteCarloSamplingMethodTest >> testNumberOfValues [

	self assert: generator numberOfValues equals: numberOfValues
]

{ #category : 'accessing' }
CMMonteCarloSamplingMethodTest >> testRejectsInvalidNumberOfValues [

	self should: [ generator numberOfValues: -1 ] raise: Error.
	self should: [ generator numberOfValues: 0.5 ] raise: Error.
]
