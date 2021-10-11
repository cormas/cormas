Class {
	#name : #CMBushmeatCell,
	#superclass : #CMSpatialEntityCell,
	#instVars : [
		'area',
		'attribute'
	],
	#category : #'Cormas-Model-BushmeatHunt-Core'
}

{ #category : #accessing }
CMBushmeatCell >> area [
	^ area
]

{ #category : #accessing }
CMBushmeatCell >> area: anAString [
	area := anAString
]

{ #category : #accessing }
CMBushmeatCell >> attribute [
	^ attribute
]

{ #category : #accessing }
CMBushmeatCell >> attribute: anAString [
	attribute := anAString
]
