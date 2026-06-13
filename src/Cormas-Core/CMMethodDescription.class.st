Class {
	#name : 'CMMethodDescription',
	#superclass : 'Object',
	#instVars : [
		'method',
		'sourceCode',
		'documentationString',
		'examples',
		'arguments',
		'returnInfo',
		'relatedMethods'
	],
	#category : 'Cormas-Core-Helpers',
	#package : 'Cormas-Core',
	#tag : 'Helpers'
}

{ #category : 'instance creation' }
CMMethodDescription class >> for: aMethod [

	^ self new
		initializeWithMethod: aMethod;
		yourself
]

{ #category : 'accessing' }
CMMethodDescription >> arguments [

	^ arguments
]

{ #category : 'accessing' }
CMMethodDescription >> documentationString [

	^ documentationString
]

{ #category : 'accessing' }
CMMethodDescription >> examples [

	^ examples
]

{ #category : 'extracting' }
CMMethodDescription >> extractArguments [

	| pragmas |
	
	pragmas := method pragmas select: [ :p |
		p selector = #argument:type:description: ].
	
	arguments := pragmas collect: [ :p |
		{ 
			'name' -> p arguments first .
			'type' -> p arguments second .
			'description' -> p arguments third
		} asDictionary ]
]

{ #category : 'extracting' }
CMMethodDescription >> extractDocumentationString [
	
	documentationString := method pragmas
		detect: [ :p | p selector = #doc: ]
		ifFound: [ :p | p arguments first ]
		ifNone: [ '' ]
]

{ #category : 'extracting' }
CMMethodDescription >> extractExamples [

	| pragmas |
	
	pragmas := method pragmas select: [ :p |
		p selector = #example: ].
	
	examples := pragmas collect: [ :p | p arguments first ]
]

{ #category : 'extracting' }
CMMethodDescription >> extractRelatedMethods [

	| pragma |
	relatedMethods := OrderedCollection new.
	
	pragma := method pragmas
		detect: [ :p | p selector = #seeAlso: ]
		ifNone: [ ^ self ].
		
	relatedMethods addAll: (pragma arguments first collect: [ :selector |
		(method methodClass canUnderstand: selector) ifFalse: [ 
			self error: (String streamContents: [ :stream |
				stream
					<< 'Method #'
					<< selector
					<< ' is not defined in class '
					<< method methodClass name
					<< '. Please fix the pragma <'
					<< pragma selector 
					<< ' ''...''> in method '
					<< method methodClass name 
					<< ' >> #'
					<< method selector ]) ].	
		
		method methodClass >> selector ]).
]

{ #category : 'extracting' }
CMMethodDescription >> extractReturnInfo [

	method pragmas detect: [ :p |
		p selector = #returnType:description: ]
		ifFound: [ :p |
			returnInfo := {
				'type' -> p arguments first .
				'description' -> p arguments second
			} asDictionary ]
]

{ #category : 'extracting' }
CMMethodDescription >> extractSourceCodeWithoutPragmas [

	| ast |
	ast := method ast copy.
	
	method pragmas do: [ :p |
		ast removePragmaNamed: p selector ].
	
	sourceCode := ast formattedCode
]

{ #category : 'testing' }
CMMethodDescription >> hasArguments [

	^ arguments isNotEmpty
]

{ #category : 'testing' }
CMMethodDescription >> hasDocumentationString [

	^ documentationString isNotEmpty
]

{ #category : 'testing' }
CMMethodDescription >> hasExamples [

	^ examples isNotEmpty
]

{ #category : 'testing' }
CMMethodDescription >> hasRelatedMethods [

	^ relatedMethods isNotEmpty
]

{ #category : 'testing' }
CMMethodDescription >> hasReturnInfo [

	^ returnInfo isNotNil
]

{ #category : 'initialization' }
CMMethodDescription >> initializeWithMethod: aMethod [

	method := aMethod.
	
	self extractDocumentationString.
	self extractArguments.
	self extractReturnInfo.
	self extractExamples.
	self extractRelatedMethods.
	self extractSourceCodeWithoutPragmas
]

{ #category : 'accessing' }
CMMethodDescription >> method [

	^ method
]

{ #category : 'accessing' }
CMMethodDescription >> relatedMethods [

	^ relatedMethods
]

{ #category : 'accessing' }
CMMethodDescription >> returnInfo [

	^ returnInfo
]

{ #category : 'accessing' }
CMMethodDescription >> sourceCode [

	^ sourceCode
]
