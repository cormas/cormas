"
I am a road whose direction depends on an attribute that can change, for testing `CMLink`.
"
Class {
	#name : 'CMMockHighway',
	#superclass : 'CMMockRoad',
	#instVars : [
		'isOneWay'
	],
	#category : 'Cormas-Mocks',
	#package : 'Cormas-Mocks'
}

{ #category : 'accessing' }
CMMockHighway >> isDirected [

	^ isOneWay ifNil: [ true ]
]

{ #category : 'accessing' }
CMMockHighway >> isOneWay: aBoolean [

	isOneWay := aBoolean
]
