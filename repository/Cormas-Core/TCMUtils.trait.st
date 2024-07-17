Trait {
	#name : #TCMUtils,
	#category : 'Cormas-Core-Tools'
}

{ #category : #accessing }
TCMUtils classSide >> friendlyName [
	" Answer a <String> with the receiver's name without any Cormas prefix "

	^ (self name beginsWith: 'CM')
		ifTrue: [ self name allButFirst: 2 ]
		ifFalse: [ self name ]
]

{ #category : #accessing }
TCMUtils >> friendlyName [
	" See comment in class side "

	^ self class friendlyName
]
