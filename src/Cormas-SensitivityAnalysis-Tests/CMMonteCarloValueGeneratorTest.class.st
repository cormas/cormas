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
		10.7274076718499
		15.467263220561325
		18.220006622476507
		22.453895589548114
		28.472299789298464
		29.074504179449054
		31.20876521859726
		32.30521348412391
		32.791338070664246
		40.86794010869597).
		
	self assert: generator generate closeTo: expected precision: 0.00000000001.
]

{ #category : 'tests' }
CMMonteCarloValueGeneratorTest >> testGenerateIntegers [

	| expected |
	generator beInteger.
	expected := #(11 15 18 22 28 29 31 32 33 41).
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
