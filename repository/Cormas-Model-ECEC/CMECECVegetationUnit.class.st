Class {
	#name : #CMECECVegetationUnit,
	#superclass : #CMSpatialEntityCell,
	#instVars : [
		'biomass'
	],
	#classInstVars : [
		'K',
		'r',
		'palette'
	],
	#category : #'Cormas-Model-ECEC'
}

{ #category : #accessing }
CMECECVegetationUnit class >> K [
	| tmp2 |
	tmp2 := K.
	^ tmp2 ifNil: [ K := 10 ] ifNotNil: [ tmp2 ]
]

{ #category : #accessing }
CMECECVegetationUnit class >> K: arg1 [
	K := arg1
]

{ #category : #'default value' }
CMECECVegetationUnit class >> K_default [
	^ 10
]

{ #category : #'default value' }
CMECECVegetationUnit class >> biomass_default [
	^ 0
]

{ #category : #testing }
CMECECVegetationUnit class >> isAbstract [
	^ false
]

{ #category : #'default value' }
CMECECVegetationUnit class >> k_default [
	^ 10
]

{ #category : #'default value' }
CMECECVegetationUnit class >> palette [
	| tmp2 |
	tmp2 := palette.
	^ tmp2
		ifNil: [ palette := RTMultiLinearColor new
				colors: (RTColorPalette sequential colors: 9 scheme: 'YlGnBu') ]
		ifNotNil: [ tmp2 ]
]

{ #category : #accessing }
CMECECVegetationUnit class >> r [
	| tmp2 |
	tmp2 := r.
	^ tmp2 ifNil: [ r := 0.2 ] ifNotNil: [ tmp2 ]
]

{ #category : #accessing }
CMECECVegetationUnit class >> r: arg1 [
	r := arg1
]

{ #category : #'default value' }
CMECECVegetationUnit class >> r_default [
	^ 0.2
]

{ #category : #'default value' }
CMECECVegetationUnit class >> state_default [
	^ nil
]

{ #category : #converting }
CMECECVegetationUnit >> asPopupText [
	^ 'biomass: ' , biomass asString
]

{ #category : #accessing }
CMECECVegetationUnit >> biomass [
	| tmp2 |
	tmp2 := biomass.
	^ tmp2 ifNil: [ biomass := 0 ] ifNotNil: [ tmp2 ]
]

{ #category : #accessing }
CMECECVegetationUnit >> biomass: arg1 [
	biomass = arg1
		ifTrue: [ ^ nil ].
	biomass := arg1.
	self changed
]

{ #category : #init }
CMECECVegetationUnit >> initRandomBiomass [
	self biomass: Cormas random
]

{ #category : #growth }
CMECECVegetationUnit >> logisticGrowth [
	self
		biomass: (Cormas logisticGrowth: self biomass r: self class r K: self class K)
]

{ #category : #control }
CMECECVegetationUnit >> pov [
	^ self class palette rtValue: self biomass / 10.0
]

{ #category : #pov }
CMECECVegetationUnit >> povBiomass [
	^ self
		povAttribute: #biomass
		min: 0
		max: self class K
		color: Color green
]

{ #category : #control }
CMECECVegetationUnit >> step [
	self logisticGrowth
]
