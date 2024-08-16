Class {
	#name : 'CMPredefinedListValueGeneratorTest',
	#superclass : 'TestCase',
	#instVars : [
		'generator',
		'list'
	],
	#category : 'Cormas-SensitivityAnalysis-Tests',
	#package : 'Cormas-SensitivityAnalysis-Tests'
}

{ #category : 'running' }
CMPredefinedListValueGeneratorTest >> setUp [

	super setUp.
	generator := CMPredefinedListValueGenerator new.
	list := #(1 4 3 5 0.12 5).
	
	generator values: list.
]

{ #category : 'tests' }
CMPredefinedListValueGeneratorTest >> testGenerate [
	
	self assert: generator generate equals: list
	
]

{ #category : 'tests' }
CMPredefinedListValueGeneratorTest >> testNumberOfValues [
	
	self assert: generator numberOfValues equals: list size
	
]
