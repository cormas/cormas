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
