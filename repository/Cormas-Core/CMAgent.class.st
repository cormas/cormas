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
CMAgent class >> ad2ClassInfo [
self deprecated:'Should be deprecated in the next CORMAS version'.
	^'

Instance Variables:
	dead 	<Boolean> '
]

{ #category : #deprecated }
CMAgent class >> dead_default [
self deprecated:'Should be deprecated in the next CORMAS version'.
	^false
]

{ #category : #deprecated }
CMAgent class >> newBoss33: attributList [ 
	"Create Agent with only #id and #dead values."

	| ag |
	self deprecated:'Should be deprecated in the next CORMAS version'.
	ag := super newBoss: (OrderedCollection with: attributList first).
	attributList removeFirst.
	attributList with: #(#dead:)
		do: [:array1Element :array2Element | ag perform: array2Element with: array1Element].
	^ag
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
self halt
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

{ #category : #deprecated }
CMAgent >> representBinaryOn33: bos [ 
	"The basic approach is to create an instance method named representBinaryOn: in the class whose BOSS representation you want to customize. The method typically returns a MessageSend, which is created by sending a receiver:selector:arguments: message to that class. The receiver argument identifies the class that is to create an instance, typically the object's class. The selector argument is the name of the instance-creation method that is to be used when the data is read by BOSS. The arguments argument is a collection of data values, typically the values of the object's instance variables.
dead"

	| msg |
	self deprecated:'Should be deprecated in the next CORMAS version'.
	msg := super representBinaryOn: bos.
	msg arguments first add: self dead.
	^msg
]

{ #category : #control }
CMAgent >> step [
	self subclassResponsibility
]
