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
String >> asValidCormasClassName [
	
	| validName |
	
	validName := self capitalized.
	validName := validName withoutBlanks.
	validName := validName withoutLeadingDigits.
	validName := validName withoutQuoting.
	(validName asUppercase beginsWith: 'CM')
		ifFalse: [ validName := 'CM' , validName ].
	^ validName asSymbol
]
