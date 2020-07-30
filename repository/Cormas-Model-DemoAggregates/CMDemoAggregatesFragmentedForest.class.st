Class {
	#name : #CMDemoAggregatesFragmentedForest,
	#superclass : #CMSpatialEntityNotConnex,
	#category : #'Cormas-Model-DemoAggregates'
}

{ #category : #'pov symbols' }
CMDemoAggregatesFragmentedForest class >> CMSpatialEntityPOV_FragmentedEntity [
"Returns an array containing the settings of a CMSpatial entity pov symbol in the following order:
(color red) (color green) (color blue)"
^Array with: 0.0 with: 0.670004 with: 0.0
]

{ #category : #'pov symbols' }
CMDemoAggregatesFragmentedForest class >> defaultColor [ 
"Returns the default color (Automatically defined by Cormas)." 
^(Color red: 0.0 green: 0.670004 blue: 0.0)
]

{ #category : #testing }
CMDemoAggregatesFragmentedForest class >> isAbstract [ 
^false
]

{ #category : #procedure }
CMDemoAggregatesFragmentedForest >> minSurface [
"return the surface of the smallest grove"
	^Cormas minOf: #surface amongObjects: self components
]

{ #category : #control }
CMDemoAggregatesFragmentedForest >> step [
	
	self components do: [:g | g swell].
	self changed
]

{ #category : #control }
CMDemoAggregatesFragmentedForest >> swell [
	
	super swell
]
