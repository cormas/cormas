Class {
	#name : #CMDemoAggregatesGrove,
	#superclass : #CMSpatialEntityAggregate,
	#category : #'Cormas-Model-DemoAggregates'
}

{ #category : #'pov symbols' }
CMDemoAggregatesGrove class >> CMSpatialEntityPOV_Grove [
	^ Array with: 0.0 with: 1.0 with: 0.0
]

{ #category : #'pov symbols' }
CMDemoAggregatesGrove class >> CMSpatialEntityPOV_big [
	^ Array with: 0.0 with: 0.340007 with: 0.0
]

{ #category : #'pov symbols' }
CMDemoAggregatesGrove class >> CMSpatialEntityPOV_medium [
	^ Array with: 0.0 with: 0.670004 with: 0.0
]

{ #category : #'pov symbols' }
CMDemoAggregatesGrove class >> CMSpatialEntityPOV_small [
	^ Array with: 0.0 with: 1.0 with: 0.0
]

{ #category : #'pov symbols' }
CMDemoAggregatesGrove class >> defaultColor [
	^ Color green
]

{ #category : #testing }
CMDemoAggregatesGrove class >> isAbstract [
	^ false
]

{ #category : #control }
CMDemoAggregatesGrove >> expand [
	| tmp1 |
	tmp1 := Cormas
		elementsFrom: self surround
		withMaxValue: #forestSurroundingRatio.
	tmp1 size >= (self surround size / 10)
		ifTrue: [ tmp1 := Cormas
				selectRandomlyFrom: tmp1
				subCollectionSize: (self surround size / 10) rounded ].
	tmp1 do: [ :arg1 | arg1 tree: true ]
]

{ #category : #pov }
CMDemoAggregatesGrove >> povSize [
	self components size < 50
		ifTrue: [ ^ #small ].
	self components size < 250
		ifTrue: [ ^ #medium ].
	^ #big
]

{ #category : #procedure }
CMDemoAggregatesGrove >> setForest [
	self components do: [ :arg1 | arg1 tree: true ]
]

{ #category : #control }
CMDemoAggregatesGrove >> swell [
	^ super swell
		and: [ self components do: [ :arg1 | arg1 tree: true ].
			true ]
]
