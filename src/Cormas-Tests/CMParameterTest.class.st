Class {
	#name : 'CMParameterTest',
	#superclass : 'TestCase',
	#instVars : [
		'parameters'
	],
	#category : 'Cormas-Tests',
	#package : 'Cormas-Tests'
}

{ #category : 'running' }
CMParameterTest >> setUp [

	super setUp.
	
	CMMockModel allEntityClasses do: #initializeParameters.
	parameters := CMMockModel parameters.
]

{ #category : 'tests' }
CMParameterTest >> testEquality [

	| parameter1 parameter2 |
	
	parameter1 := CMParameter
		getterSelector: #initialEnergy
		setterSelector: #initialEnergy:
		receiver: CMMockAnimal.
		
	parameter2 := CMParameter
		getterSelector: #initialEnergy
		setterSelector: #initialEnergy:
		receiver: CMMockAnimal.
		
	self assert: parameter1 equals: parameter2.
]

{ #category : 'tests' }
CMParameterTest >> testHash [

	| parameter1 parameter2 |
	
	parameter1 := CMParameter
		getterSelector: #initialEnergy
		setterSelector: #initialEnergy:
		receiver: CMMockAnimal.
		
	parameter2 := CMParameter
		getterSelector: #initialEnergy
		setterSelector: #initialEnergy:
		receiver: CMMockAnimal.
		
	self assert: parameter1 hash equals: parameter2 hash.
]

{ #category : 'tests' }
CMParameterTest >> testInequality [

	| parameter1 parameter2 parameter3 parameter4 |
	
	parameter1 := CMParameter
		getterSelector: #initialEnergy
		setterSelector: #initialEnergy:
		receiver: CMMockAnimal.
		
	parameter2 := CMParameter
		getterSelector: #initializeParameters
		setterSelector: #initialEnergy:
		receiver: CMMockAnimal.
		
	parameter3 := CMParameter
		getterSelector: #initialEnergy
		setterSelector: #initializeParameters
		receiver: CMMockAnimal.
		
	parameter4 := CMParameter
		getterSelector: #initialEnergy
		setterSelector: #initialEnergy:
		receiver: CMMockCow.
		
	self deny: parameter2 equals: parameter1.
	self deny: parameter3 equals: parameter1.
	self deny: parameter4 equals: parameter1.
]

{ #category : 'tests' }
CMParameterTest >> testParameterNames [

	| expectedNames actualNames |
	
	expectedNames := Set withAll: #(
		initialEnergy
		initialNumberOfCows
		initialNumberOfGoats
		numberOfRows
		numberOfColumns).
		
	actualNames := (parameters collect: [ :each | each name ]) asSet.
	self assertCollection: actualNames hasSameElements: expectedNames.
]

{ #category : 'tests' }
CMParameterTest >> testReceiverClasses [

	| expectedClasses actualClasses |
	
	expectedClasses := Set withAll: {
		CMMockModel .
		CMMockAnimal .
		CMMockCow .
		CMMockGoat }.
		
	actualClasses := (parameters collect: [ :each | each receiver ]) asSet.
	self assertCollection: actualClasses hasSameElements: expectedClasses.
]

{ #category : 'tests' }
CMParameterTest >> testSetValue [

	| parameter |
	
	parameter := CMParameter
		getterSelector: #initialEnergy
		setterSelector: #initialEnergy:
		receiver: CMMockAnimal.
		
	parameter value: 42.
	self assert: parameter value equals: 42.
	self assert: CMMockAnimal initialEnergy equals: 42.
	self assert: CMMockCow initialEnergy equals: 42.
	self assert: CMMockGoat initialEnergy equals: 42.
]

{ #category : 'tests' }
CMParameterTest >> testSetValueSubclass [

	| parameter |
	
	parameter := CMParameter
		getterSelector: #initialEnergy
		setterSelector: #initialEnergy:
		receiver: CMMockGoat.
		
	parameter value: 42.
	self assert: parameter value equals: 42.
	self assert: CMMockAnimal initialEnergy equals: 0.5.
	self assert: CMMockCow initialEnergy equals: 0.5.
	self assert: CMMockGoat initialEnergy equals: 42.
]

{ #category : 'tests' }
CMParameterTest >> testSubclassesHaveSuperclassParameters [

	| expectedParameters |
	
	expectedParameters := { 
		CMParameter
			getterSelector: #initialEnergy
			setterSelector: #initialEnergy:
			receiver: CMMockAnimal.
			
		CMParameter
			getterSelector: #initialEnergy
			setterSelector: #initialEnergy:
			receiver: CMMockCow.
			
		CMParameter
			getterSelector: #initialEnergy
			setterSelector: #initialEnergy:
			receiver: CMMockGoat
	}.

	self assertCollection: parameters includesAll: expectedParameters.
]

{ #category : 'tests' }
CMParameterTest >> testValue [

	| parameter |
	
	parameter := CMParameter
		getterSelector: #initialEnergy
		setterSelector: #initialEnergy:
		receiver: CMMockAnimal.
		
	self assert: parameter value equals: 0.5.
]

{ #category : 'tests' }
CMParameterTest >> testValueSubclass [

	| parameter |
	
	parameter := CMParameter
		getterSelector: #initialEnergy
		setterSelector: #initialEnergy:
		receiver: CMMockGoat.
		
	self assert: parameter value equals: 0.5.
]
