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
		getterMethod: (CMMockAnimal class >> #initialEnergy)
		setterMethod: (CMMockAnimal class >> #initialEnergy:)
		receiverClass: CMMockAnimal.
		
	parameter2 := CMParameter
		getterMethod: (CMMockAnimal class >> #initialEnergy)
		setterMethod: (CMMockAnimal class >> #initialEnergy:)
		receiverClass: CMMockAnimal.
		
	self assert: parameter1 equals: parameter2.
]

{ #category : 'tests' }
CMParameterTest >> testHash [

	| parameter1 parameter2 |
	
	parameter1 := CMParameter
		getterMethod: (CMMockAnimal class >> #initialEnergy)
		setterMethod: (CMMockAnimal class >> #initialEnergy:)
		receiverClass: CMMockAnimal.
		
	parameter2 := CMParameter
		getterMethod: (CMMockAnimal class >> #initialEnergy)
		setterMethod: (CMMockAnimal class >> #initialEnergy:)
		receiverClass: CMMockAnimal.
		
	self assert: parameter1 hash equals: parameter2 hash.
]

{ #category : 'tests' }
CMParameterTest >> testInequality [

	| parameter1 parameter2 parameter3 parameter4 |
	
	parameter1 := CMParameter
		getterMethod: (CMMockAnimal class >> #initialEnergy)
		setterMethod: (CMMockAnimal class >> #initialEnergy:)
		receiverClass: CMMockAnimal.
		
	parameter2 := CMParameter
		getterMethod: (CMMockAnimal class >> #initializeParameters)
		setterMethod: (CMMockAnimal class >> #initialEnergy:)
		receiverClass: CMMockAnimal.
		
	parameter3 := CMParameter
		getterMethod: (CMMockAnimal class >> #initialEnergy)
		setterMethod: (CMMockAnimal class >> #initializeParameters)
		receiverClass: CMMockAnimal.
		
	parameter4 := CMParameter
		getterMethod: (CMMockAnimal class >> #initialEnergy)
		setterMethod: (CMMockAnimal class >> #initialEnergy:)
		receiverClass: CMMockCow.
		
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
		
	actualClasses := (parameters collect: [ :each | each receiverClass ]) asSet.
	self assertCollection: actualClasses hasSameElements: expectedClasses.
]

{ #category : 'tests' }
CMParameterTest >> testSetValue [

	| parameter |
	
	parameter := CMParameter
		getterMethod: (CMMockAnimal class >> #initialEnergy)
		setterMethod: (CMMockAnimal class >> #initialEnergy:)
		receiverClass: CMMockAnimal.
		
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
		getterMethod: (CMMockAnimal class >> #initialEnergy)
		setterMethod: (CMMockAnimal class >> #initialEnergy:)
		receiverClass: CMMockGoat.
		
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
			getterMethod: (CMMockAnimal class >> #initialEnergy)
			setterMethod: (CMMockAnimal class >> #initialEnergy:)
			receiverClass: CMMockAnimal.
			
		CMParameter
			getterMethod: (CMMockAnimal class >> #initialEnergy)
			setterMethod: (CMMockAnimal class >> #initialEnergy:)
			receiverClass: CMMockCow.
			
		CMParameter
			getterMethod: (CMMockAnimal class >> #initialEnergy)
			setterMethod: (CMMockAnimal class >> #initialEnergy:)
			receiverClass: CMMockGoat
	}.

	self assertCollection: parameters includesAll: expectedParameters.
]

{ #category : 'tests' }
CMParameterTest >> testValue [

	| parameter |
	
	parameter := CMParameter
		getterMethod: (CMMockAnimal class >> #initialEnergy)
		setterMethod: (CMMockAnimal class >> #initialEnergy:)
		receiverClass: CMMockAnimal.
		
	self assert: parameter value equals: 0.5.
]

{ #category : 'tests' }
CMParameterTest >> testValueSubclass [

	| parameter |
	
	parameter := CMParameter
		getterMethod: (CMMockAnimal class >> #initialEnergy)
		setterMethod: (CMMockAnimal class >> #initialEnergy:)
		receiverClass: CMMockGoat.
		
	self assert: parameter value equals: 0.5.
]
