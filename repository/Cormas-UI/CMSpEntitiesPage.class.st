Class {
	#name : #CMSpEntitiesPage,
	#superclass : #CMSpPresenter,
	#instVars : [
		'spatialList',
		'socialList',
		'passiveList'
	],
	#category : #'Cormas-UI-Spec2-ProjectBrowser'
}

{ #category : #specs }
CMSpEntitiesPage class >> defaultSpec [
	<spec>
	^ SpBoxLayout newLeftToRight
		add: #spatialList;
		add: #socialList;
		add: #passiveList;
		yourself
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
