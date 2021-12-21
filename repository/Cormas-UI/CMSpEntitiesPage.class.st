Class {
	#name : #CMSpEntitiesPage,
	#superclass : #CMProjectSpPresenter,
	#instVars : [
		'spatialList',
		'socialList',
		'passiveList',
		'classPath'
	],
	#category : #'Cormas-UI-Spec2-Entities'
}

{ #category : #specs }
CMSpEntitiesPage class >> defaultSpec [
	<spec>
	^ SpBoxLayout newTopToBottom 
		add: #classPath height: self labelHeight;
		add: (SpBoxLayout newLeftToRight
			spacing: 5;
			add: #spatialList;
			add: #socialList;
			add: #passiveList;
			yourself);
		yourself
]

{ #category : #accessing }
CMSpEntitiesPage >> classPath [

	^ classPath
]

{ #category : #accessing }
CMSpEntitiesPage >> classPath: anObject [

	classPath := anObject
]

{ #category : #initialization }
CMSpEntitiesPage >> initializePresenters [

	classPath := self newLabel.
	spatialList := self instantiate: CMClassTreeSpPresenter on: ('Spatial' -> self spatialClasses).
	socialList := self instantiate: CMClassTreeSpPresenter on: ('Social' -> self socialClasses).
	passiveList := self instantiate: CMClassTreeSpPresenter on: ('Passive' -> self passiveClasses).
]

{ #category : #accessing }
CMSpEntitiesPage >> passiveList [

	^ passiveList
]

{ #category : #accessing }
CMSpEntitiesPage >> passiveList: anObject [

	passiveList := anObject
]

{ #category : #accessing }
CMSpEntitiesPage >> socialList [

	^ socialList
]

{ #category : #accessing }
CMSpEntitiesPage >> socialList: anObject [

	socialList := anObject
]

{ #category : #accessing }
CMSpEntitiesPage >> spatialList [

	^ spatialList
]

{ #category : #accessing }
CMSpEntitiesPage >> spatialList: anObject [

	spatialList := anObject
]

{ #category : #callbacks }
CMSpEntitiesPage >> updateClassPath: newTopClass [

	self classPath: (self instantiate: CMClassPathPresenter on: newTopClass)
]
