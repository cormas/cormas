Class {
	#name : 'CMDataFixture',
	#superclass : 'Object',
	#instVars : [
		'data',
		'expectedCsv'
	],
	#category : 'Cormas-UI-Tests-Core',
	#package : 'Cormas-UI-Tests',
	#tag : 'Core'
}

{ #category : 'accessing' }
CMDataFixture >> data [

	^ data
]

{ #category : 'as yet unclassified' }
CMDataFixture >> dataAsCsv [

	^ expectedCsv
]

{ #category : 'inspecting' }
CMDataFixture >> example [
	<script: 'self new inspect'>
]

{ #category : 'initialization' }
CMDataFixture >> initialize [
	
	super initialize.
	
	data := OrderedCollection withAll: { 
		{ 'Number of cows' -> 10 . 'Number of goats' -> 5 } asDictionary .
		{ 'Number of cows' -> 15 . 'Number of goats' -> 4 } asDictionary .
		{ 'Number of cows' -> 20 . 'Number of goats' -> 2 } asDictionary .
		{ 'Number of cows' -> 25 . 'Number of goats' -> 3 } asDictionary
	}.
	
	expectedCsv := 'Number of cows,Number of goats
10,5
15,4
20,2
25,3
'.
]
