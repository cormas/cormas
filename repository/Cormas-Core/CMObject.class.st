Class {
	#name : #CMObject,
	#superclass : #Object,
	#instVars : [
		'translator'
	],
	#category : #'Cormas-Core-Others'
}

{ #category : #accessing }
CMObject class >> cmEnvironment [
	" Answer a <Collection> or receiver's package as replacement for VW Namespaces "
	
	^ self package classes
]

{ #category : #printing }
CMObject class >> cmPrintHierarchy [
	"Purpose: to show the hierarchy of all the subclasses of the receiver
	Return value: a byteString"

	"CMAgent cmPrintHierarchy"

	^ String streamContents: [ :stream | self printSubclassesOn: stream level: 0 ]
]

{ #category : #'printing - documentation' }
CMObject class >> printSubclassesOn: aStream level: level [
	"As part of the algorithm for printing a description of the receiver, print the
	subclass on the file stream, aStream, indenting level times."
	
	| subs |
	level isZero
		ifFalse: [
			aStream cr.
			2 * level timesRepeat: [ aStream space ] ]. 	"aStream print: self name asString."
	aStream nextPutAll: self name asString.	"aStream space; nextPut: $(.
	self instVarNames
		do: [:aName | aStream print: aName]
		separatedBy: [aStream space].
	aStream nextPut: $)."
	subs := self subclasses.	"self == Class ifTrue:
		[aStream crtab: level+1; nextPutAll: (#AllTheMetaclasses << #dialogs >> '... all the Metaclasses ...') asString.
		subs := subs reject: [:sub | sub isMeta]]."
	"Print subclasses in alphabetical order"
	(subs asSortedCollection: [ : a : b | a name <= b name ])
			do: [ : sub | sub printSubclassesOn: aStream level: level + 1 ]
]

{ #category : #accessing }
CMObject >> appSettingsClass [ 

	^ CMApplicationPreferences
]

{ #category : #accessing }
CMObject >> projectManager [ 
	" Probably should be deleted "

	^ CMProjectManager allInstances anyOne
]

{ #category : #accessing }
CMObject >> translator [
	" Answer the receiver's <PFTranslator> "

	^ self projectManager translator.
]
