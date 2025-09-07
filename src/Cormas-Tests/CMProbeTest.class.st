Class {
	#name : 'CMProbeTest',
	#superclass : 'TestCase',
	#instVars : [
		'probe',
		'probeWithDifferentMethod',
		'probeWithDifferentModel',
		'probeWithDifferentIsActive',
		'probeWithoutName',
		'probeWithoutMethod',
		'probeWithoutObject',
		'probeWithDifferentName',
		'probeWithDifferentColor',
		'probeWithoutColor'
	],
	#category : 'Cormas-Tests',
	#package : 'Cormas-Tests'
}

{ #category : 'running' }
CMProbeTest >> setUp [

	| model differentModel |
	super setUp.
	
	model := CMMockModel new.
	model initFixed.
	
	differentModel := CMMockModel new.
	
	probe := CMProbe
		name: 'Number of alive cells'
		colorString: '0000FF'
		selector: #numberOfAliveCells
		on: model.
		
	probeWithDifferentName := CMProbe
		name: 'Number of living cells'
		colorString: '0000FF'
		selector: #numberOfAliveCells
		on: model.
		
	probeWithDifferentMethod := CMProbe
		name: 'Number of alive cells'
		colorString: '0000FF'
		selector: #numberOfDeadCells
		on: model.
		
	probeWithDifferentColor := CMProbe
		name: 'Number of alive cells'
		colorString: 'FF0000'
		selector: #numberOfAliveCells
		on: model.
		
	probeWithDifferentModel := CMProbe
		name: 'Number of alive cells'
		colorString: '0000FF'
		selector: #numberOfAliveCells
		on: differentModel.
		
	probeWithDifferentIsActive := probe copy.
	probeWithDifferentIsActive isActive: probe isActive not.
	
	probeWithoutName := CMProbe new
		colorString: '0000FF';
		selector: #numberOfAliveCells;
		object: model;
		yourself.
		
	probeWithoutMethod := CMProbe new
		name: 'Number of alive cells';
		colorString: '0000FF';
		object: model;
		yourself.
		
	probeWithoutObject := CMProbe new
		name: 'Number of alive cells';
		colorString: '0000FF';
		selector: #numberOfAliveCells;
		yourself.
		
	probeWithoutColor := CMProbe new
		name: 'Number of alive cells';
		selector: #numberOfAliveCells;
		object: model;
		yourself.
]

{ #category : 'tests' }
CMProbeTest >> testEquality [

	self assert: probe equals: probe copy.
]

{ #category : 'tests' }
CMProbeTest >> testHash [

	self assert: probe hash equals: probe copy hash.
]

{ #category : 'tests' }
CMProbeTest >> testInequality [

	self deny: probe equals: probeWithDifferentName.
	self deny: probe equals: probeWithDifferentColor.
	self deny: probe equals: probeWithDifferentMethod.
	self deny: probe equals: probeWithDifferentModel.
	self deny: probe equals: probeWithDifferentIsActive.
	self deny: probe equals: probeWithoutName.
	self deny: probe equals: probeWithoutMethod.
	self deny: probe equals: probeWithoutObject.
	self deny: probe equals: probeWithoutColor.
]

{ #category : 'tests' }
CMProbeTest >> testIsActive [

	probe isActive: false.
	self deny: probe isActive
]

{ #category : 'tests' }
CMProbeTest >> testIsActiveByDefault [

	self assert: probe isActive
]

{ #category : 'tests' }
CMProbeTest >> testValue [

	self assert: probe value equals: 11.
	self assert: probeWithDifferentMethod value equals: 5.
]
