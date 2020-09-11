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

{ #category : #control }
CMAgent >> delete [
"Purpose: gets rid of this object. The collectGarbage is IMMEDIATELY performed  (ie. the receiver of class X is removed from 'theXXXs' collection)"

	self dead: true.
	self collector removeEntity: self
]

{ #category : #testing }
CMAgent >> destroyed [
"Answer if the agent is dead"
	^self dead
]

{ #category : #accessing }
CMAgent >> destroyed: aBoolean [
"Set the dead variable to True or False and delete the figures"
	dead := aBoolean.
	(aBoolean and:[self isSituated]) ifTrue:[self leave].
]

{ #category : #deprecated }
CMAgent >> displayOn: aGC at: unPoint [

self deprecated:'Should be deprecated in the next CORMAS version'.

	"| couleur |
	couleur := self color.
	couleur notNil ifTrue: 
			[self class image class = EntityPOV
				ifTrue: [self class image color: couleur]. 
			self class image displayOn: aGC at: unPoint]"
]

{ #category : #testing }
CMAgent >> isDead [
	^ self dead
]

{ #category : #control }
CMAgent >> step [
	self subclassResponsibility
]
