"
CMAgent is the abstract class of all agents classes in CORMAS.
"
Class {
	#name : #CMAgent,
	#superclass : #CMEntity,
	#instVars : [
		'dead'
	],
	#category : #'Cormas-Core-Entities'
}

{ #category : #deprecated }
CMAgent class >> dead_default [
self deprecated:'Should be deprecated in the next CORMAS version'.
	^false
]

{ #category : #accessing }
CMAgent >> dead [
	^dead ifNil: [dead := false]
]

{ #category : #accessing }
CMAgent >> dead: aBoolean [ 
"Set the dead variable to True or False
aBoolean < Boolean >"
	dead := aBoolean
]

{ #category : #controlling }
CMAgent >> delete [
"Purpose: gets rid of this object. The collectGarbage is IMMEDIATELY performed  (ie. the receiver of class X is removed from 'theXXXs' collection)"

	self dead: true.
	self collector ifNotNil: [ : c | c removeEntity: self ]
]

{ #category : #testing }
CMAgent >> destroyed [
	" Answer if the agent is dead "
	
	self deprecated: 'Should use #isDestroyed or #isDead '.
	^ self dead
]

{ #category : #accessing }
CMAgent >> destroyed: aBoolean [
"Set the dead variable to True or False and delete the figures"
	dead := aBoolean.
	(aBoolean and:[self isSituated]) ifTrue:[self leave].
]

{ #category : #printing }
CMAgent >> interestingDetails [
	" Answer a <Collection> of interesting receiver's attributes, from a modeler point of view, to display in a popup for example "

	^ super interestingDetails , { 
		'Dead: ' -> (self dead asString)
		}
]

{ #category : #testing }
CMAgent >> isAgent [
	
	^ true
]

{ #category : #testing }
CMAgent >> isDead [
	^ self dead
]

{ #category : #testing }
CMAgent >> isDestroyed [
	" Answer if the agent is dead "
	
	^ self dead
]

{ #category : #control }
CMAgent >> step [
	self subclassResponsibility
]
