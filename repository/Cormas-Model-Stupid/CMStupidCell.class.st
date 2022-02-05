"
Stupid cell 
"
Class {
	#name : #CMStupidCell,
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
CMStupidCell class >> maxFoodProductionRate [
	^ maxFoodProductionRate ifNil: [ maxFoodProductionRate := 0.01 ]
]

{ #category : #accessing }
CMStupidCell class >> maxFoodProductionRate: aFloat [
	maxFoodProductionRate := aFloat
]

{ #category : #converting }
CMStupidCell >> asString [
	" Private - See superimplementor's comment "

	^ String streamContents: [ : stream |
		stream 
			<< super asString;
			cr;
			<< 'food: ';
			<< food asString ]
]

{ #category : #accessing }
CMStupidCell >> food [
	^ food ifNil: [ food :=  0.1]
]

{ #category : #accessing }
CMStupidCell >> food: anObject [
	food := anObject
]

{ #category : #pov }
CMStupidCell >> pov [
	^ self class palette rtValue: self food
]

{ #category : #control }
CMStupidCell >> step [
	self updateFood.
]

{ #category : #pov }
CMStupidCell >> updateFood [
	self
		food: self food + (self food * (Cormas randomFloatFrom: 0 to: self class maxFoodProductionRate))
]
