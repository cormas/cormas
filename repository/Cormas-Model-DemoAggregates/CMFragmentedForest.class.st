Class {
	#name : #CMFragmentedForest,
	#superclass : #CMSpatialEntityNotConnex,
	#category : 'Cormas-Model-DemoAggregates'
}

{ #category : #'pov symbols' }
CMFragmentedForest class >> CMSpatialEntityPOV_FragmentedEntity [
"Returns an array containing the settings of a CMSpatial entity pov symbol in the following order:
(color red) (color green) (color blue)"
^Array with: 0.0 with: 0.670004 with: 0.0
]

{ #category : #'pov symbols' }
CMFragmentedForest class >> defaultColor [ 
"Returns the default color (Automatically defined by Cormas)." 
^(Color red: 0.0 green: 0.670004 blue: 0.0)
]

{ #category : #testing }
CMFragmentedForest class >> isAbstract [ 
^false
]

{ #category : #procedure }
CMFragmentedForest >> minSurface [
"return the surface of the smallest grove"
	^Cormas minOf: #surface amongObjects: self components
]

{ #category : #control }
CMFragmentedForest >> step [
	
	self components do: [:g | g swell].
	self changed
]

{ #category : #control }
CMFragmentedForest >> swell [
	
	super swell
]
