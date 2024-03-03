Extension { #name : #String }

{ #category : #'*Cormas-Core' }
String >> asBoolean [

	self = 'false' ifTrue: [^false].
	self =  'true'  ifTrue: [^true].
	self = 'nil' ifTrue: [^nil].
	self error:  'unrecognized boolean name'.
]

{ #category : #'*Cormas-Core' }
String >> asValidCormasClassName: aCMProjectName [
	" Answer the receiver <Symbol> as valid as CORMAS class name along with the project name . 
	Currently a CORMAS class name is valid if :
	- It does not contain blanks
	- It does not begin with digits
	- It is not quoted
	- Begins with CM
	- It is a Symbol "

	| validName |
	
	self assert: (aCMProjectName notEmpty and: [ self notEmpty ]).
	validName := self capitalized.
	validName := validName withoutBlanks.
	validName := validName withoutLeadingDigits.
	validName := validName withoutQuoting.
	
	(validName asUppercase beginsWith: aCMProjectName asUppercase) ifFalse: [
		validName := aCMProjectName, validName ].
			
	^ validName asSymbol
	
]
