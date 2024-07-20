"
This class is the main class of CORMAS. It is instanciated from the VisualLauncher menu.
All the useful method for user are class method into utils's protocols, ex: Cormas random.
To run Cormas: 
		VW -> Tools -> Cormas -> Cormas english
or select the following instruction and 'Do it':
		CormasLauncher launchCormas

	instanceVariableNames: 'listEntiteRessource listEntiteSociete listAttribut nomModele nomEntite nomMethode aPartirDe lesEntitesType listMethode commeEntiteType classBuilder typeEntite lesAttributsTempo menuBar espaceModel vue compteur cycle dModelBuilder simulationCourante modeleCourant mode observationGOSIsOn classesOS nomGroupe classeGroupe ressources methodes modeRessource listeSelectA listeSelectB tailleSlider modeDisplay imageOS imageOSInVue lastSelection tailleHolder '



	classVariableNames: ''



	poolDictionaries: ''



	category: 'Plate forme'
"
Class {
	#name : 'Cormas',
	#superclass : 'Object',
	#instVars : [
		'cycle',
		'cormasModel',
		'process'
	],
	#classInstVars : [
		'simpleRand',
		'randomGenerator'
	],
	#category : 'Cormas-Core-Legacy',
	#package : 'Cormas-Core',
	#tag : 'Legacy'
}

{ #category : 'utilities - value types' }
Cormas class >> arrayFrom: anElementOrArray [
	"return an array for the argument"
	
	^ anElementOrArray isArray
		ifTrue: [ anElementOrArray ]
		ifFalse: [ Array with: anElementOrArray ]
]

{ #category : 'private_aleat' }
Cormas class >> initRandom [
	"seed := nil.
	Rand := nil"
	
	
]

{ #category : 'utilities - mathematics' }
Cormas class >> logisticGrowth: x r: r K: K [
	"Purpose: Returns the next value of X(t+1), according to the discrete logistic equation :
	 X(t+1) = X(t) + dx /dt  "

	^ x + (self logisticIncrease: x r: r K: K)
]

{ #category : 'utilities - mathematics' }
Cormas class >> logisticGrowthContinuous: x r: r K: K [
	"Returns the next value of X(t+1), according to the continuous logistic equation :
	 f(x,t) = x(t) = K / [(K-Xo)/Xo . exp(- r.t) + 1]   "
	
	^K / ((K - x) / x * (2.71828 raisedTo: r negated) + 1)
]

{ #category : 'utilities - mathematics' }
Cormas class >> logisticIncrease: x r: r K: K [
	"Returns the increase of X (dx /dt), according to the discrete logistic equation :
	 dx / dt  = r . x . (K - X(t)) / K "
	
	^r * x * (K - x) / K
]

{ #category : 'accessing' }
Cormas class >> mix: aCollection [
	"Purpose: Returns a randomly mixed collection
Argument: aCollection is a collection to be mixed"

	^ aCollection asOrderedCollection shuffledBy: self randomGenerator
]

{ #category : 'utilities - random' }
Cormas class >> nextInteger: anInteger [

	^ self randomIntegerFrom: 1 to: anInteger
]

{ #category : 'utilities - random' }
Cormas class >> random [
	^ self randomGenerator next
]

{ #category : 'utilities - random' }
Cormas class >> randomColor [
"Purpose: Returns a random ColorValue
Example: Cormas randomColor"
	^Color registeredColorNames atRandom: self randomGenerator
]

{ #category : 'utilities - random' }
Cormas class >> randomFrom: startInteger to: endInteger [
	| extent |
	extent := endInteger - startInteger + 1.
	^endInteger min: (Cormas random * extent) truncated + startInteger
]

{ #category : 'accessing' }
Cormas class >> randomGenerator [
	^ randomGenerator ifNil: [ randomGenerator := PMFishmanMooreRandomGenerator new ]
]

{ #category : 'accessing' }
Cormas class >> randomGenerator: aRandomGenerator [
	randomGenerator := aRandomGenerator
]

{ #category : 'utilities - random' }
Cormas class >> randomIntegerFrom: startInteger to: endInteger [
	"Purpose: Return a random Integer between 'startInteger' and 'endInteger': 
	startInteger <= randInteger <= endInteger, ie. randInteger ‚Ç¨ [startInteger ; endInteger].
Examples: Cormas randomFrom: 0 to: 100.
Examples: Cormas randomFrom: -4 to: 10
		10 timesRepeat: [Cormas randomFrom: 0 to: 10] => 10 1 7 0 4 0 6 10 7 "
	
	^self randomFrom: startInteger to: endInteger
]

{ #category : 'utilities - random' }
Cormas class >> randomSeed: aValue [
	"Purpose: Set the initial value of the RandFishmanMoore suit. Without this method, the initial value is equal to Time millisecondClockValue.
Argument: aValue must be an integer greater than 1.
Example : 
	3 timesRepeat: 
			[Cormas randomSeed: 100.
			6 timesRepeat: 
					[Cormas random printString printOn: Transcript].
					Transcript flush; cr] "
	
	self seed: aValue
]

{ #category : 'private_aleat' }
Cormas class >> releaseRandomSeed [
	"Release the randomSeed. 
For example, if the initilizations of the simulations were done with fixed random seed (identical initial state for each simulation), then with #initRandomSeed called after initilization, the  simulations may be different"

	randomGenerator := nil
]

{ #category : 'accessing' }
Cormas class >> seed [
	^ self randomGenerator seed
]

{ #category : 'accessing' }
Cormas class >> seed: anInteger [
	self randomGenerator seed: anInteger
]

{ #category : 'utilities - collection' }
Cormas class >> selectEntitiesWithMaxOf: aMagnitudeName amongEntities: aCollection verifying: aCondition [
	"Purpose: selects the entities with the maximum value of a given magnitude and verifying a specified condition. 
Arguments: aMagnitudeName = <ByteSymbol>
			aCollection = <Collection(Entity)>
			aCondition = <BlockClosure>
Return value: <Collection(Entity)>
Example: Cormas selectEntitiesWithMaxOf: #water amongEntities self theCells verifying: [:c | c isPolluted not]"
	
	| selection |
	selection := aCollection
		select:
			[:c | ((c perform: aMagnitudeName) respondsTo: #>) and: [aCondition value: c]].
	selection := selection
		asSortedCollection:
			[:i :j | (i perform: aMagnitudeName) > (j perform: aMagnitudeName)].
	selection := selection
		select:
			[:c | (c perform: aMagnitudeName) = (selection first perform: aMagnitudeName)].
	^selection
]

{ #category : 'utilities - random' }
Cormas class >> selectRandomlyFrom: aCollection [

	aCollection ifEmpty: [ ^ nil ].
	^ aCollection atRandom: self
]

{ #category : 'private_aleat' }
Cormas class >> simpleRandom [
	" Return a pseudo-random value according to the Random equation. No seed.
	It is also useful for non-entities, as display processes for example"

	^ (simpleRand ifNil: [ simpleRand := Random new ]) next
]

{ #category : 'utilities - value types' }
Cormas class >> splitString: aString with: aChar [
	"Purpose: Splits a string according to a given separator character and returns a collection of the splited portions of the string
Examples: Cormas splitString: 'Hello world;Bonjour le monde;Bom dia Mundo;Buenos Dias Mundo' with: $; "
	
	| stream collec |
	stream := aString readStream.
	collec := OrderedCollection new.
	[stream atEnd] whileFalse: [collec add: (stream upTo: aChar)].
	stream close.
	^collec
]

{ #category : 'accessing' }
Cormas >> cormasModel [
	
	^cormasModel
]

{ #category : 'accessing' }
Cormas >> cormasModel: aCormasModel [
	"set the new simulation and give a reference to cormas"

	cormasModel := aCormasModel.
]

{ #category : 'initialization' }
Cormas >> initialize [

	super initialize.
	cycle ifNotNil: [ cycle := NewValueHolder value: 0 ]
]

{ #category : 'accessing' }
Cormas >> process [
	
	^process
]

{ #category : 'accessing' }
Cormas >> process: aProcess [
	process := aProcess
]

{ #category : 'accessing' }
Cormas >> spaceModel [
	
	^self cormasModel ifNotNil: [:sim | sim spaceModel]
]
