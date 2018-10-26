Class {
	#name : #CMMorphicRoassalAdapter,
	#superclass : #MorphicRoassalAdapter,
	#category : #'Cormas-UI-Core'
}

{ #category : #private }
CMMorphicRoassalAdapter >> buildWidget [
	self flag: 'Remove whenLastEventChangedDo:'.
	^ CMSimulationGridSpec new
		whenLastEventChangedDo: self whenLastEventChangedBlock;
		yourself
]
