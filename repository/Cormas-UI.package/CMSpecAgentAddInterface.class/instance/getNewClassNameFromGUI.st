actions
getNewClassNameFromGUI
	" Answer a <String> with a valid Smalltalk class name "	

	| aName |
	self halt.
	(aName := self newClassName textValuePending) isEmpty
		ifFalse: [
			aName first isLetter ifFalse: [ aName := self defaultClassPrefix , aName ].
			(self projectManager verifyClassExist: aName)
				ifTrue: [ self cormas alertNameAlreadyExist. 	^nil ] ]
		ifTrue: [ ^ nil ].
	^ aName capitalized