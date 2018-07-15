Class {
	#name : #ConditionTransitionTable,
	#superclass : #Object,
	#instVars : [
		'conditionMap'
	],
	#category : 'Cormas-Core-HotDraw'
}

{ #category : #accessing }
ConditionTransitionTable >> goto: aState [
	
	self
		onCondition: #(true false) asOrderedCollection
		goto: aState
]

{ #category : #'initialize-release' }
ConditionTransitionTable >> initialize [
	"Initialize a newly created instance. This method must answer the receiver."
	
	super initialize.	" *** Replace this comment with the appropriate initialization code *** "
	^self
]

{ #category : #accessing }
ConditionTransitionTable >> nextStateForTool: aTool event: anEvent [
	
	1
		to: conditionMap size
		do:
			[:i | 
			| each |
			each := conditionMap at: i.
			each key = (aTool valueAt: #condition) ifTrue: [^each value]].
	^nil
]

{ #category : #accessing }
ConditionTransitionTable >> onCondition: boolCollection goto: aToolState [
	
	conditionMap ifNil: [conditionMap := OrderedCollection new].
	conditionMap add: boolCollection -> aToolState
]
