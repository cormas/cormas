Class {
	#name : #Blind,
	#superclass : #'Strategy_Family',
	#category : #'Cormas-Model-ReHab'
}

{ #category : #testing }
Blind class >> isAbstract [
^false
]

{ #category : #accessing }
Blind >> possibleLocations [

	^super possibleLocations
]
