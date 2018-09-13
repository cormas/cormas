"
Stupides cell 
"
Class {
	#name : #CMStupideCell,
	#superclass : #CMSpatialEntityCell,
	#instVars : [
		'food'
	],
	#classVars : [
		'maxFoodProductionRate',
		'pallete'
	],
	#category : #'Cormas-Model-Stupid'
}

{ #category : #accessing }
CMStupideCell class >> maxFoodProductionRate [
	^ maxFoodProductionRate ifNil: [ maxFoodProductionRate := 0.01 ]
]

{ #category : #accessing }
CMStupideCell class >> maxFoodProductionRate: anObject [
	maxFoodProductionRate := anObject
]

{ #category : #accessing }
CMStupideCell class >> pallete [

	^ pallete ifNil: [ pallete := RTMultiLinearColor new
		colors: (RTColorPalette sequential colors: 9 scheme: 'YlGnBu') ].
]

{ #category : #accessing }
CMStupideCell >> food [
	^ food ifNil: [ food :=  0.1]
]

{ #category : #accessing }
CMStupideCell >> food: anObject [
	food := anObject
]

{ #category : #pov }
CMStupideCell >> pov [

	^ self class pallete
		rtValue: (self food)
]

{ #category : #pov }
CMStupideCell >> step [
	self updateFood.
]

{ #category : #pov }
CMStupideCell >> updateFood [
	self
		food: self food + (self food * (Cormas randomFloatFrom: 0 to: self class maxFoodProductionRate))
]
