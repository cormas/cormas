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
		'MaxFoodProductionRate'
	],
	#category : #'Cormas-Model-Stupid'
}

{ #category : #accessing }
CMStupidCell class >> maxFoodProductionRate [

	^ MaxFoodProductionRate
		  ifNil: [ MaxFoodProductionRate := 0.01 ]
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

{ #category : #converting }
CMStupidCell >> interestingDetails [
	" Answer a <Collection> of interesting receiver's attributes, from a modeler point of view, to display in a popup for example "

	^ super interestingDetails , { 
		'Food: ' -> (self food asString)
		}
]

{ #category : #pov }
CMStupidCell >> pov [

	^ self
		  povAttribute: #food
		  min: 0.1
		  max: 0.3
		  color: Color green
]

{ #category : #control }
CMStupidCell >> step [
	self updateFood.
]

{ #category : #accessing }
CMStupidCell >> updateFood [

	self food: self food + (self food
		 * (Cormas randomFloatFrom: 0 to: self class maxFoodProductionRate))
]
