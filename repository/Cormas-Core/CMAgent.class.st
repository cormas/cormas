"
CMAgent is the abstract class of all agents classes in CORMAS.
"
Class {
	#name : 'CMAgent',
	#superclass : 'CMEntity',
	#instVars : [
		'isDead'
	],
	#category : 'Cormas-Core-Entities',
	#package : 'Cormas-Core',
	#tag : 'Entities'
}

{ #category : 'deprecated' }
CMAgent class >> dead_default [
self deprecated:'Should be deprecated in the next CORMAS version'.
	^false
]

{ #category : 'controlling' }
CMAgent >> delete [
"Purpose: gets rid of this object. The collectGarbage is IMMEDIATELY performed  (ie. the receiver of class X is removed from 'theXXXs' collection)"

	self die.
	self collector ifNotNil: [ : c | c removeEntity: self ]
]

{ #category : 'accessing' }
CMAgent >> destroyed: aBoolean [
"Set the dead variable to True or False and delete the figures"
	isDead := aBoolean.
	(aBoolean and:[self isSituated]) ifTrue:[self leave].
]

{ #category : 'controlling' }
CMAgent >> die [

	isDead := true
]

{ #category : 'initialization' }
CMAgent >> initialize [

	super initialize.
	isDead := false.
]

{ #category : 'printing' }
CMAgent >> interestingDetails [
	" Answer a <Collection> of interesting receiver's attributes, from a modeler point of view, to display in a popup for example "

	^ super interestingDetails , { 
		'Dead: ' -> (self isDead asString)
		}
]

{ #category : 'testing' }
CMAgent >> isAgent [
	
	^ true
]

{ #category : 'accessing' }
CMAgent >> isAlive [

	^ isDead not
]

{ #category : 'accessing' }
CMAgent >> isDead [

	^ isDead
]

{ #category : 'control' }
CMAgent >> step [
	self subclassResponsibility
]
