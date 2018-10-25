Class {
	#name : #CMSimulationGrid,
	#superclass : #CMSimulationGridSpec,
	#category : #'Cormas-UI-Core'
}

{ #category : #'instance creation' }
CMSimulationGrid class >> new [
self basicNew.
]

{ #category : #'instance creation' }
CMSimulationGrid >> on: aModel with: cells [
	self initializeOn: aModel.
	self subscribeOn: aModel.
	super on: aModel with: cells.

]

{ #category : #'instance creation' }
CMSimulationGrid >> on: aModel with: cells and: situatedEntities [
	self initializeOn: aModel.
	self subscribeOn: aModel.
	super on: aModel with: cells and: situatedEntities.

]

{ #category : #'instance creation' }
CMSimulationGrid >> on: aModel with: cells and: situatedEntities withProbe: probeName [
	self initializeOn: aModel.
	self subscribeOn: aModel.
	super on: aModel with: cells and: situatedEntities withProbe: probeName.

]

{ #category : #'instance creation' }
CMSimulationGrid >> on: aModel withCells: cells withSituatedEntities: situatedEntities [
	self initializeOn: aModel.
	self subscribeOn: aModel.
	super
		on: aModel
		withCells: cells
		withSituatedEntities: situatedEntities
]
