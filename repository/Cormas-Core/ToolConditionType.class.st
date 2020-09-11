Class {
	#name : #ToolConditionType,
	#superclass : #Object,
	#instVars : [
		'toolConditionResult'
	],
	#category : 'Cormas-Core-HotDraw'
}

{ #category : #accessing }
ToolConditionType class >> transition [
	
	^#toolCondition
]

{ #category : #verifying }
ToolConditionType >> conflictsWith: aTransitionType [
	
	(aTransitionType isKindOf: ToolConditionType) ifFalse: [^false].
	^self toolConditionResult = aTransitionType toolConditionResult
]

{ #category : #'initialize-release' }
ToolConditionType >> initialize [
	"Initialize a newly created instance. This method must answer the receiver."
	
	super initialize.	" *** Replace this comment with the appropriate initialization code *** "
	^self
]

{ #category : #printing }
ToolConditionType >> printOn: aStream [
	
	super printOn: aStream.
	aStream
		nextPut: $/;
		cr.
	aStream print: toolConditionResult
]

{ #category : #accessing }
ToolConditionType >> toolConditionResult [
	
	^toolConditionResult
]

{ #category : #accessing }
ToolConditionType >> toolConditionResult: anObject [
	
	toolConditionResult := anObject
]

{ #category : #compilation }
ToolConditionType >> writeDefinitionOn: codeStream to: aString [
	
	codeStream nextPutAll: '(ConditionTransitionTable new) '.
	self writeMessageSendOn: codeStream to: aString
]

{ #category : #compilation }
ToolConditionType >> writeMessageSendOn: codeStream to: aString [
	
	codeStream nextPutAll: 'onCondition: '.
	codeStream nextPutAll: toolConditionResult printString.
	codeStream
		nextPutAll: ' goto: ';
		nextPutAll: aString
]
