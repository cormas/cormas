Class {
	#name : 'CMMonteCarloValueGeneratorTest',
	#superclass : 'TestCase',
	#instVars : [
		'generator'
	],
	#category : 'Cormas-SensitivityAnalysis-Tests',
	#package : 'Cormas-SensitivityAnalysis-Tests'
}

{ #category : 'running' }
CMMonteCarloValueGeneratorTest >> setUp [

	super setUp.
	generator := CMMonteCarloValueGenerator new.
	generator randomSeed: 42.
	
	generator
		lowValue: 10;
		highValue: 50;
		numberOfValues: 10.
]

{ #category : 'tests' }
CMMonteCarloValueGeneratorTest >> testGenerate [

	| expected |
	
	expected := #(
		31.20876521859726
		28.472299789298464
		15.467263220561325
		10.7274076718499
		18.220006622476507
		32.791338070664246
		29.074504179449054
		32.30521348412391
		22.453895589548114
		40.86794010869597).
		
	self assert: generator generate closeTo: expected precision: 0.00000000001.
]

{ #category : 'tests' }
CMMonteCarloValueGeneratorTest >> testGenerateIntegers [

	| expected |
	generator beInteger.
	expected := #(31 28 15 11 18 33 29 32 22 41).
	self assert: generator generate equals: expected.
]

{ #category : 'accessing' }
CMMonteCarloValueGeneratorTest >> testNumberOfValues [

	self assert: generator numberOfValues equals: 10 
]

{ #category : 'accessing' }
CMMonteCarloValueGeneratorTest >> testRejectsInvalidNumberOfValues [

	self should: [ generator numberOfValues: -1 ] raise: Error.
	self should: [ generator numberOfValues: 0.5 ] raise: Error.
]
