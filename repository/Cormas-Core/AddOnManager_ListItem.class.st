Class {
	#name : #'AddOnManager_ListItem',
	#superclass : #Object,
	#instVars : [
		'file',
		'nameAsString',
		'versionAsString',
		'shouldLoad',
		'typeAsString',
		'authorAsString',
		'fileAsString',
		'dateAsString',
		'categoryAsString',
		'addOnDescription'
	],
	#category : 'Cormas-Core-Tools'
}

{ #category : #'instance creation' }
AddOnManager_ListItem class >> new [
	"Answer a newly created and initialized instance."
	
	^super new initialize
]

{ #category : #'instance creation' }
AddOnManager_ListItem class >> newOnFile: aFile [
	
	| x stream line |
	x := super new initialize.
	x file: aFile.
	x fileAsString: aFile tail.
	aFile extension = '.st' ifTrue: [x typeAsString: 'ST'].
	aFile extension = '.pcl' ifTrue: [x typeAsString: 'Parcel'].
	x
		dateAsString:
			((aFile dates at: #modified) first printFormat: #(3 2 1 $- 1 1)).
	x shouldLoad: false.
	x typeAsString = 'ST'
		ifTrue:
			[stream := aFile readStream.
			[stream atEnd]
				whileFalse:
					[line := stream upTo: Character cr.
					(line indexOfSubCollection: '<Add-On-Name>' startingAt: 1) ~= 0
						ifTrue:
							[x
								nameAsString:
									(line
										copyFrom: (line indexOf: $>) + 1
										to: (line indexOfSubCollection: '</' startingAt: 1) - 1)].
					(line indexOfSubCollection: '<Add-On-Version>' startingAt: 1) ~= 0
						ifTrue:
							[x
								versionAsString:
									(line
										copyFrom: (line indexOf: $>) + 1
										to: (line indexOfSubCollection: '</' startingAt: 1) - 1)].
					(line indexOfSubCollection: '<Add-On-Author>' startingAt: 1) ~= 0
						ifTrue:
							[x
								authorAsString:
									(line
										copyFrom: (line indexOf: $>) + 1
										to: (line indexOfSubCollection: '</' startingAt: 1) - 1)].
					(line indexOfSubCollection: '<Add-On-Category>' startingAt: 1) ~= 0
						ifTrue:
							[x
								categoryAsString:
									(line
										copyFrom: (line indexOf: $>) + 1
										to: (line indexOfSubCollection: '</' startingAt: 1) - 1)].
					(line indexOfSubCollection: '<Add-On-Description>' startingAt: 1) ~= 0
						ifTrue:
							[x
								addOnDescription:
									(line
										copyFrom: (line indexOf: $>) + 1
										to: (line indexOfSubCollection: '</' startingAt: 1) - 1)]].
			stream close.
			x nameAsString
				ifNil:
					[x
						nameAsString:
							(x fileAsString
								copyFrom: 1
								to: x fileAsString size - 3)]].
	x typeAsString = 'Parcel'
		ifTrue:
			[x
				nameAsString:
					(aFile tail
						copyFrom: 1
						to: aFile tail size - 4)	"			x versionAsString: 
			x authorAsString: 
			x categoryAsString: 
			x addOnDescription: 			"].
	^x
]

{ #category : #accessing }
AddOnManager_ListItem >> addOnDescription [
	
	^addOnDescription
]

{ #category : #accessing }
AddOnManager_ListItem >> addOnDescription: anObject [
	
	addOnDescription := anObject
]

{ #category : #accessing }
AddOnManager_ListItem >> authorAsString [
	
	^authorAsString
]

{ #category : #accessing }
AddOnManager_ListItem >> authorAsString: anObject [
	
	authorAsString := anObject
]

{ #category : #accessing }
AddOnManager_ListItem >> categoryAsString [
	
	^categoryAsString
]

{ #category : #accessing }
AddOnManager_ListItem >> categoryAsString: anObject [
	
	categoryAsString := anObject
]

{ #category : #accessing }
AddOnManager_ListItem >> dateAsString [
	
	^dateAsString
]

{ #category : #accessing }
AddOnManager_ListItem >> dateAsString: anObject [
	
	dateAsString := anObject
]

{ #category : #accessing }
AddOnManager_ListItem >> file [
	
	^file
]

{ #category : #accessing }
AddOnManager_ListItem >> file: anObject [
	
	file := anObject
]

{ #category : #accessing }
AddOnManager_ListItem >> fileAsString [
	
	^fileAsString
]

{ #category : #accessing }
AddOnManager_ListItem >> fileAsString: anObject [
	
	fileAsString := anObject
]

{ #category : #'initialize-release' }
AddOnManager_ListItem >> initialize [
	"Initialize a newly created instance. This method must answer the receiver."
	" *** Replace this comment with the appropriate initialization code *** "
	
	^self
]

{ #category : #accessing }
AddOnManager_ListItem >> nameAsString [
	
	^nameAsString
]

{ #category : #accessing }
AddOnManager_ListItem >> nameAsString: anObject [
	
	nameAsString := anObject
]

{ #category : #accessing }
AddOnManager_ListItem >> shouldLoad [
	
	^shouldLoad
]

{ #category : #accessing }
AddOnManager_ListItem >> shouldLoad: anObject [
	
	shouldLoad := anObject
]

{ #category : #accessing }
AddOnManager_ListItem >> typeAsString [
	
	^typeAsString
]

{ #category : #accessing }
AddOnManager_ListItem >> typeAsString: anObject [
	
	typeAsString := anObject
]

{ #category : #accessing }
AddOnManager_ListItem >> versionAsString [
	
	^versionAsString
]

{ #category : #accessing }
AddOnManager_ListItem >> versionAsString: anObject [
	
	versionAsString := anObject
]
