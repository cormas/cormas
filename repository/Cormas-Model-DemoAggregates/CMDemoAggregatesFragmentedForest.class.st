Class {
	#name : #CMDemoAggregatesFragmentedForest,
	#superclass : #CMSpatialEntityNotConnex,
	#category : #'Cormas-Model-DemoAggregates'
}

{ #category : #'pov symbols' }
CMDemoAggregatesFragmentedForest class >> CMSpatialEntityPOV_FragmentedEntity [
	^ Array with: 0.0 with: 0.670004 with: 0.0
]

{ #category : #'pov symbols' }
CMDemoAggregatesFragmentedForest class >> defaultColor [
	^ Color red: 0.0 green: 0.670004 blue: 0.0
]

{ #category : #testing }
CMDemoAggregatesFragmentedForest class >> isAbstract [
	^ false
]

{ #category : #procedure }
CMDemoAggregatesFragmentedForest >> minSurface [
	^ Cormas minOf: #surface amongObjects: self components
]

{ #category : #control }
CMDemoAggregatesFragmentedForest >> step [
	self components do: [ :arg1 | arg1 swell ].
	self changed
]

{ #category : #control }
CMDemoAggregatesFragmentedForest >> swell [
	super swell
]
