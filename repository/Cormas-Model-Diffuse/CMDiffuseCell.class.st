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
	#category : #'Cormas-Model-Diffuse'
}

{ #category : #id }
CMDiffuseCell class >> CurrentId [
	^ CurrentId isNil
		ifTrue: [ 0 ]
		ifFalse: [ CurrentId ]
]

{ #category : #id }
CMDiffuseCell class >> CurrentId: arg1 [
	^ CurrentId := arg1
]

{ #category : #accessing }
CMDiffuseCell class >> diffusionRate [
	diffusionRate isNil
		ifTrue: [ diffusionRate := 0.5 ].
	^ diffusionRate
]

{ #category : #accessing }
CMDiffuseCell class >> diffusionRate: arg1 [
	diffusionRate := arg1
]

{ #category : #'default value' }
CMDiffuseCell class >> diffusionRate_default [
	^ 0.5
]

{ #category : #accessing }
CMDiffuseCell class >> evaporationRate [
	evaporationRate isNil
		ifTrue: [ evaporationRate := 0.1 ].
	^ evaporationRate
]

{ #category : #accessing }
CMDiffuseCell class >> evaporationRate: arg1 [
	evaporationRate := arg1
]

{ #category : #'default value' }
CMDiffuseCell class >> evaporationRate_default [
	^ 0.1
]

{ #category : #testing }
CMDiffuseCell class >> isAbstract [
	^ false
]

{ #category : #'default value' }
CMDiffuseCell class >> lostOrReceivedQty_default [
	^ 0
]

{ #category : #accessing }
CMDiffuseCell class >> minimunState [
	minimunState isNil
		ifTrue: [ minimunState := 1 ].
	^ minimunState
]

{ #category : #accessing }
CMDiffuseCell class >> minimunState: arg1 [
	minimunState := arg1
]

{ #category : #'default value' }
CMDiffuseCell class >> minimunState_default [
	^ 1
]

{ #category : #'default value' }
CMDiffuseCell class >> qty_default [
	^ 0
]

{ #category : #accessing }
CMDiffuseCell class >> scheduler [
	^ scheduler
]

{ #category : #accessing }
CMDiffuseCell class >> scheduler: arg1 [
	scheduler := arg1
]

{ #category : #'default value' }
CMDiffuseCell class >> scheduler_default [
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
	| tmp1 tmp3 |
	self qty > 0
		ifTrue: [ tmp1 := self qty * CMDiffuseCell diffusionRate / self connexity.
			tmp3 := 0.
			self neighbourhood
				do: [ :arg1 | 
					tmp3 := tmp3 + tmp1.
					arg1 lostOrReceivedQty: arg1 lostOrReceivedQty + tmp1 ].
			self lostOrReceivedQty: self lostOrReceivedQty - tmp3 ]
]

{ #category : #control }
CMDiffuseCell >> diffuse2 [
	| tmp1 |
	self qty > 0
		ifTrue: [ tmp1 := self qty * CMDiffuseCell diffusionRate
				/ self neighbourhood size.
			self neighbourhood
				do: [ :arg1 | arg1 lostOrReceivedQty: arg1 lostOrReceivedQty + tmp1 ].
			self
				lostOrReceivedQty: self lostOrReceivedQty - (self qty * CMDiffuseCell diffusionRate) ]
]

{ #category : #control }
CMDiffuseCell >> evaporate [
	self
		qty: (self qty - (self qty * CMDiffuseCell evaporationRate) max: 0)
]

{ #category : #info }
CMDiffuseCell >> info_Qty [
	^ self qty
]

{ #category : #init }
CMDiffuseCell >> initEmpty [
	self
		qty: 0;
		lostOrReceivedQty: self qty
]

{ #category : #init }
CMDiffuseCell >> initId [
	self id: (self class CurrentId: self class CurrentId + 1)
]

{ #category : #accessing }
CMDiffuseCell >> lostOrReceivedQty [
	lostOrReceivedQty isNil
		ifTrue: [ lostOrReceivedQty := 0 ].
	^ lostOrReceivedQty
]

{ #category : #accessing }
CMDiffuseCell >> lostOrReceivedQty: arg1 [
	lostOrReceivedQty := arg1.
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
	qty isNil
		ifTrue: [ qty := 0 ].
	^ qty
]

{ #category : #accessing }
CMDiffuseCell >> qty: arg1 [
	| tmp2 |
	qty := arg1.
	qty > 0
		ifTrue: [ CMDiffuseCell scheduler newActiveCells add: self ]
		ifFalse: [ CMDiffuseCell scheduler noMoreActiveCells add: self ].
	tmp2 := self.
	tmp2
		defineVisualState;
		show
]

{ #category : #control }
CMDiffuseCell >> updateState [
	self lostOrReceivedQty ~= 0
		ifTrue: [ self
				qty: (self qty + self lostOrReceivedQty) asFloat;
				lostOrReceivedQty: 0.
			self qty < CMDiffuseCell minimunState
				ifTrue: [ self qty: 0 ] ]
]
