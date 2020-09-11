"
I'm a Cell in Diffuse model
"
Class {
	#name : #CMDiffuseCell,
	#superclass : #CMSpatialEntityElement,
	#instVars : [
		'qty',
		'lostOrReceivedQty'
	],
	#classVars : [
		'CurrentId'
	],
	#classInstVars : [
		'minimunState',
		'diffusionRate',
		'evaporationRate',
		'scheduler'
	],
	#category : 'Cormas-Model-Diffuse'
}

{ #category : #id }
CMDiffuseCell class >> CurrentId [
	^ CurrentId isNil
		ifTrue: [ 0 ]
		ifFalse: [ CurrentId ]
]

{ #category : #id }
CMDiffuseCell class >> CurrentId: x [
	^ CurrentId := x
]

{ #category : #accessing }
CMDiffuseCell class >> diffusionRate [
	"Getter accessor with default value = 50 % "

	diffusionRate isNil
		ifTrue: [ diffusionRate := 0.5 ].
	^ diffusionRate
]

{ #category : #accessing }
CMDiffuseCell class >> diffusionRate: anObject [
	diffusionRate := anObject
]

{ #category : #'- default value' }
CMDiffuseCell class >> diffusionRate_default [
	"Return the default value of diffusionRate attribute"

	^ 0.5
]

{ #category : #accessing }
CMDiffuseCell class >> evaporationRate [
	"Getter accessor with default value = 0.1 "

	evaporationRate isNil
		ifTrue: [ evaporationRate := 0.1 ].
	^ evaporationRate
]

{ #category : #accessing }
CMDiffuseCell class >> evaporationRate: anObject [
	evaporationRate := anObject
]

{ #category : #'- default value' }
CMDiffuseCell class >> evaporationRate_default [
	"Return the default value of evaporationRate attribute"

	^ 0.1
]

{ #category : #testing }
CMDiffuseCell class >> isAbstract [
	^ false
]

{ #category : #'- default value' }
CMDiffuseCell class >> lostOrReceivedQty_default [
	"Return the default value of lostOrReceivedQty attribute"

	^ 0
]

{ #category : #accessing }
CMDiffuseCell class >> minimunState [
	"Getter accessor with default value = 1 "

	minimunState isNil
		ifTrue: [ minimunState := 1 ].
	^ minimunState
]

{ #category : #accessing }
CMDiffuseCell class >> minimunState: anObject [
	minimunState := anObject
]

{ #category : #'- default value' }
CMDiffuseCell class >> minimunState_default [
	"Return the default value of minimunState attribute"

	^ 1
]

{ #category : #'- default value' }
CMDiffuseCell class >> qty_default [
	"Return the default value of qty attribute"

	^ 0
]

{ #category : #accessing }
CMDiffuseCell class >> scheduler [
	^ scheduler
]

{ #category : #accessing }
CMDiffuseCell class >> scheduler: anObject [
	scheduler := anObject
]

{ #category : #'- default value' }
CMDiffuseCell class >> scheduler_default [
	"Return the default value of scheduler attribute"

	^ nil
]

{ #category : #control }
CMDiffuseCell >> connexity [
	self spaceModel nbNeighbours = #eight
		ifTrue: [ ^ 8 ].
	self spaceModel nbNeighbours = #four
		ifTrue: [ ^ 4 ].
	self spaceModel nbNeighbours = #six
		ifTrue: [ ^ 6 ]
]

{ #category : #control }
CMDiffuseCell >> diffuse [
	"Diffusion of hormons around the cell.
Each neighbours will receive a quantity equals to qty*diffusionRate/connexity.
diffusionRate is the % of hormon I should give to my neigbourhood.
If I am at the edge, I will give less hormons"

	| qtyToGiveToEachCell qtyGiven |
	self qty > 0
		ifTrue: [ qtyToGiveToEachCell := self qty * CMDiffuseCell diffusionRate / self connexity.
			qtyGiven := 0.
			self neighbourhood
				do: [ :c | 
					qtyGiven := qtyGiven + qtyToGiveToEachCell.
					c lostOrReceivedQty: c lostOrReceivedQty + qtyToGiveToEachCell ].
			self lostOrReceivedQty: self lostOrReceivedQty - qtyGiven ]
]

{ #category : #control }
CMDiffuseCell >> diffuse2 [
	"Diffusion of hormons around the cell.
Each neighbours will receive a quantity equals to
diffusionRate is the % of hormon I will give to my neigbourhood"

	| qtyToGiveToEachCell |
	self qty > 0
		ifTrue: [ qtyToGiveToEachCell := self qty * CMDiffuseCell diffusionRate / self neighbourhood size.
			self neighbourhood do: [ :c | c lostOrReceivedQty: c lostOrReceivedQty + qtyToGiveToEachCell ].
			self lostOrReceivedQty: self lostOrReceivedQty - (self qty * CMDiffuseCell diffusionRate) ]
]

{ #category : #control }
CMDiffuseCell >> evaporate [
	self qty: (self qty - (self qty * CMDiffuseCell evaporationRate) max: 0)
]

{ #category : #info }
CMDiffuseCell >> info_Qty [
	^ self qty
]

{ #category : #init }
CMDiffuseCell >> initEmpty [
	self qty: 0.
	self lostOrReceivedQty: self qty
]

{ #category : #init }
CMDiffuseCell >> initId [
	self id: (self class CurrentId: self class CurrentId + 1)
]

{ #category : #accessing }
CMDiffuseCell >> lostOrReceivedQty [
	"Getter accessor with default value = 0 "

	lostOrReceivedQty isNil
		ifTrue: [ lostOrReceivedQty := 0 ].
	^ lostOrReceivedQty
]

{ #category : #accessing }
CMDiffuseCell >> lostOrReceivedQty: anObject [
	lostOrReceivedQty := anObject.
	CMDiffuseCell scheduler newActiveCells add: self
]

{ #category : #manipulation }
CMDiffuseCell >> methodsForManipulation [
	^ #('diffuse' 'evaporate' 'initEmpty')
]

{ #category : #pov }
CMDiffuseCell >> pov [
	^ self
		povAttribute: #qty
		min: 0
		max: 100
		color: Color green 
]

{ #category : #accessing }
CMDiffuseCell >> qty [
	"Getter accessor with default value = 0 "

	qty isNil
		ifTrue: [ qty := 0 ].
	^ qty
]

{ #category : #accessing }
CMDiffuseCell >> qty: anObject [
	qty := anObject.
	qty > 0
		ifTrue: [ CMDiffuseCell scheduler newActiveCells add: self ]
		ifFalse: [ CMDiffuseCell scheduler noMoreActiveCells add: self ].
	self
		defineVisualState;
		show
]

{ #category : #control }
CMDiffuseCell >> updateState [
	self lostOrReceivedQty ~= 0
		ifTrue: [ self qty: (self qty + self lostOrReceivedQty) asFloat.
			self lostOrReceivedQty: 0.
			self qty < CMDiffuseCell minimunState
				ifTrue: [ self qty: 0 ] ]
]
