Extension { #name : #String }

{ #category : #'*Cormas-Core' }
String >> asBoolean [

	self = 'false' ifTrue: [^false].
	self =  'true'  ifTrue: [^true].
	self = 'nil' ifTrue: [^nil].
	self error:  'unrecognized boolean name'.
]

{ #category : #'*Cormas-Core' }
String >> asGetterForEntityClass [
	" Create the getter selector for the entity class aClass.

	'Object' asGetterForEntityClass -> #theObjects
	"

	^ (String streamContents: [ : stream | 
		stream 
			<< 'the';
			<< self pluralize capitalized]) asSymbol
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
	(validName asUppercase beginsWith: 'CM')
		ifFalse: [ validName := validName asUppercase = aCMProjectName asUppercase
				ifFalse: [ 'CM' , aCMProjectName , validName ]
				ifTrue: [ 'CM' , validName ] ]
		ifTrue: [ | nameWithoutPrefix |
			nameWithoutPrefix := validName allButFirst: 2.
			validName := (nameWithoutPrefix asUppercase
				beginsWith: aCMProjectName asUppercase)
				ifTrue: [ 'CM' , nameWithoutPrefix ]
				ifFalse: [ 'CM' , aCMProjectName , nameWithoutPrefix ] ].
	^ validName asSymbol
]
