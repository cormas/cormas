Class {
	#name : 'CMMockAnimal',
	#superclass : 'CMAgent',
	#instVars : [
		'energy',
		'timesRemovedFromModel'
	],
	#classInstVars : [
		'initialEnergy'
	],
	#category : 'Cormas-Mocks',
	#package : 'Cormas-Mocks'
}

{ #category : 'accessing' }
CMMockAnimal class >> initialEnergy [
	<parameterFloat: 'Initial energy' min: 0 max: 1 step: 0.1 default: 0.5>
	^ initialEnergy
]

{ #category : 'accessing' }
CMMockAnimal class >> initialEnergy: aNumber [

	initialEnergy := aNumber
]

{ #category : 'aspects' }
CMMockAnimal >> aspectDefault: look [

	<aspect>
	look size: 0.3 + (energy * 0.1)
]

{ #category : 'aspects' }
CMMockAnimal >> aspectEnergy: look [

	<aspect>
	look sizeForValue: energy from: 0 to: 10
]

{ #category : 'charts' }
CMMockAnimal >> chartEnergy [

	<chart>
	^ CMLineChart new
		  title: 'Energy';
		  line: #energy;
		  yourself
]

{ #category : 'accessing' }
CMMockAnimal >> energy [

	<parameterFloatMin: 0 max: 1 step: 0.1 default: 0.5>
	<probe>
	^ energy
]

{ #category : 'accessing' }
CMMockAnimal >> energy: aNumber [
	
	energy := aNumber 
]

{ #category : 'initialization' }
CMMockAnimal >> initialize [

	super initialize.
	energy := self class initialEnergy
]

{ #category : 'initialize-release' }
CMMockAnimal >> removedFromModel [

	super removedFromModel.
	timesRemovedFromModel := self timesRemovedFromModel + 1
]

{ #category : 'control' }
CMMockAnimal >> step [
	
	self randomWalk
]

{ #category : 'accessing' }
CMMockAnimal >> timesRemovedFromModel [

	^ timesRemovedFromModel ifNil: [ 0 ]
]
