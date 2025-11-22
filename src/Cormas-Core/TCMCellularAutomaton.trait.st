Trait {
	#name : 'TCMCellularAutomaton',
	#instVars : [
		'state',
		'bufferState'
	],
	#category : 'Cormas-Core-Traits',
	#package : 'Cormas-Core',
	#tag : 'Traits'
}

{ #category : 'accessing' }
TCMCellularAutomaton >> bufferState [
	^ bufferState
]

{ #category : 'accessing' }
TCMCellularAutomaton >> bufferState: aValue [
	bufferState := aValue
]

{ #category : 'control' }
TCMCellularAutomaton >> newState [
	"Purpose: the specific transition function of the automaton should be written here
Example: self bufferState: (test ifTrue: [value1] ifFalse: [value2])"

	self subclassResponsibility
]

{ #category : 'accessing' }
TCMCellularAutomaton >> state [
	^ state
]

{ #category : 'accessing' }
TCMCellularAutomaton >> state: aValue [
	
	state = aValue ifTrue: [^nil].
	state := aValue
]

{ #category : 'control' }
TCMCellularAutomaton >> updateState [
	"Purpose: updates 'state' attribute with the value stored in 'bufferState' attribute"

	self state ~= self bufferState
		ifTrue: [ self state: self bufferState ]
]
