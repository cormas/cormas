Class {
	#name : #CMDemoAggregatesPlot,
	#superclass : #CMSpatialEntityElement,
	#instVars : [
		'seed',
		'tree'
	],
	#category : #'Cormas-Model-DemoAggregates'
}

{ #category : #'pov symbols' }
CMDemoAggregatesPlot class >> CMSpatialEntityPOV_Plot [
	^ Array with: 1.0 with: 1.0 with: 0.0
]

{ #category : #'pov symbols' }
CMDemoAggregatesPlot class >> CMSpatialEntityPOV_black [
	^ Array with: 0.0 with: 0.0 with: 0.0
]

{ #category : #'pov symbols' }
CMDemoAggregatesPlot class >> CMSpatialEntityPOV_blue [
	^ Array with: 0.0 with: 0.0 with: 1.0
]

{ #category : #'pov symbols' }
CMDemoAggregatesPlot class >> CMSpatialEntityPOV_brown [
	^ Array with: 0.670004 with: 0.670004 with: 0.0
]

{ #category : #'pov symbols' }
CMDemoAggregatesPlot class >> CMSpatialEntityPOV_chartreuse [
	^ Array with: 0.0 with: 0.670004 with: 0.670004
]

{ #category : #'pov symbols' }
CMDemoAggregatesPlot class >> CMSpatialEntityPOV_empty [
	^ Array with: 0.0 with: 1.0 with: 0.0
]

{ #category : #'pov symbols' }
CMDemoAggregatesPlot class >> CMSpatialEntityPOV_tree [
	^ Array with: 0.0 with: 1.0 with: 0.0
]

{ #category : #'pov symbols' }
CMDemoAggregatesPlot class >> SpatialEntityPOV_empty [
	<pov: #tree>
	^ Array with: 1.0 with: 1.0 with: 1.0
]

{ #category : #'pov symbols' }
CMDemoAggregatesPlot class >> SpatialEntityPOV_tree [
	<pov: #tree>
	^ Array with: 0.0 with: 0.670004 with: 0.0
]

{ #category : #'pov symbols' }
CMDemoAggregatesPlot class >> defaultColor [
	^ Color yellow
]

{ #category : #testing }
CMDemoAggregatesPlot class >> isAbstract [
	^ false
]

{ #category : #'default value' }
CMDemoAggregatesPlot class >> seed_default [
	^ false
]

{ #category : #'parameter unit' }
CMDemoAggregatesPlot class >> seed_type [
	^ Boolean
]

{ #category : #'default value' }
CMDemoAggregatesPlot class >> tree_default [
	^ false
]

{ #category : #'parameter unit' }
CMDemoAggregatesPlot class >> tree_type [
	^ Boolean
]

{ #category : #testing }
CMDemoAggregatesPlot >> belongToAggregate [
	^ self theCSE notNil
		and: [ (self theCSE includesKey: #Aggregate)
				and: [ (self theCSE at: #Aggregate) notNil ] ]
]

{ #category : #control }
CMDemoAggregatesPlot >> forestSurroundingRatio [
	^ (self neighbourhood select: [ :arg1 | arg1 belongToAggregate ])
		size / self neighbourhood size
]

{ #category : #init }
CMDemoAggregatesPlot >> init [
	self seed: false
]

{ #category : #init }
CMDemoAggregatesPlot >> initAtt [
	super init.
	self
		seed: false;
		tree: Cormas random < 0.5
]

{ #category : #testing }
CMDemoAggregatesPlot >> isSeed [
	^ self seed = true
]

{ #category : #testing }
CMDemoAggregatesPlot >> isTree [
	^ self tree
]

{ #category : #control }
CMDemoAggregatesPlot >> newSeedAB [
	self seed isNil
		ifTrue: [ Cormas random < 0.01
				ifTrue: [ self seed: #newA ] ].
	self seed isNil
		ifTrue: [ Cormas random < 0.02
				ifTrue: [ self seed: #newB ] ]
]

{ #category : #control }
CMDemoAggregatesPlot >> newState [
	self seed: false.
	Cormas random < 0.005
		ifTrue: [ self tree
				ifTrue: [ self
						tree: false;
						seed: nil ]
				ifFalse: [ self
						tree: true;
						seed: true ] ]
]

{ #category : #pov }
CMDemoAggregatesPlot >> povSeed [
	self isSeed
		ifTrue: [ ^ #seed ].
	(self myCSE: CMDemoAggregatesGrove) ifNil: [ ^ #empty ].
	^ (self theCSE at: #CMDemoAggregatesGrove) colorId
]

{ #category : #pov }
CMDemoAggregatesPlot >> povTree [
	self tree
		ifTrue: [ ^ #tree ].
	^ #empty
]

{ #category : #accessing }
CMDemoAggregatesPlot >> seed [
	| tmp2 |
	tmp2 := seed.
	^ tmp2 ifNil: [ seed := false ] ifNotNil: [ tmp2 ]
]

{ #category : #accessing }
CMDemoAggregatesPlot >> seed: arg1 [
	seed = arg1
		ifTrue: [ ^ nil ].
	seed := arg1.
	self changed
]

{ #category : #accessing }
CMDemoAggregatesPlot >> tree [
	| tmp2 |
	tmp2 := tree.
	^ tmp2 ifNil: [ tree := false ] ifNotNil: [ tmp2 ]
]

{ #category : #accessing }
CMDemoAggregatesPlot >> tree: arg1 [
	tree = arg1
		ifTrue: [ ^ nil ].
	tree := arg1.
	self changed
]
