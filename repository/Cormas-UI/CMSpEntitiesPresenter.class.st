Class {
	#name : #CMSpEntitiesPresenter,
	#superclass : #CMProjectSpPresenter,
	#instVars : [
		'spatialList',
		'socialList',
		'passiveList',
		'classPath',
		'selectedClass'
	],
	#category : #'Cormas-UI-Spec2-Entities'
}

{ #category : #specs }
CMSpEntitiesPresenter class >> defaultSpec [
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
CMSpEntitiesPresenter >> classPath [

	^ classPath
]

{ #category : #accessing }
CMSpEntitiesPresenter >> classPath: anObject [

	classPath := anObject
]

{ #category : #initialization }
CMSpEntitiesPresenter >> connectPresenters [

	self spatialTreePresenter
		whenSelectedItemChangedDo: [ : cormasClass | 
			self socialTreePresenter unselectAll.
			self passiveTreePresenter unselectAll.
			self updateSelectedClass: cormasClass ].
	self socialTreePresenter
		whenSelectedItemChangedDo: [ : cormasClass | 
			self spatialTreePresenter unselectAll.
			self passiveTreePresenter unselectAll.		
			self updateSelectedClass: cormasClass ].
	self passiveTreePresenter
		whenSelectedItemChangedDo: [ : cormasClass | 
			self spatialTreePresenter unselectAll.
			self socialTreePresenter unselectAll.			
			self updateSelectedClass: cormasClass ].

		"transmitTo: classPath
		transform: [ : cormasClass | self updateSelectedClass: cormasClass ]"
]

{ #category : #initialization }
CMSpEntitiesPresenter >> initializePresenters [

	self classPath: (self instantiate: CMClassPathPresenter on: String empty).
	spatialList := self instantiate: CMClassTreeSpPresenter on: ('Spatial' -> self spatialClasses).
	socialList := self instantiate: CMClassTreeSpPresenter on: ('Social' -> self socialClasses).
	passiveList := self instantiate: CMClassTreeSpPresenter on: ('Passive' -> self passiveClasses).
]

{ #category : #accessing }
CMSpEntitiesPresenter >> passiveList [

	^ passiveList
]

{ #category : #accessing }
CMSpEntitiesPresenter >> passiveList: anObject [

	passiveList := anObject
]

{ #category : #'accessing - helpers' }
CMSpEntitiesPresenter >> passiveTreePresenter [

	^ self passiveList classTreePresenter
]

{ #category : #accessing }
CMSpEntitiesPresenter >> selectedClass [
	
	^ selectedClass
]

{ #category : #accessing }
CMSpEntitiesPresenter >> selectedClass: aClass [ 
	
	selectedClass := aClass
]

{ #category : #accessing }
CMSpEntitiesPresenter >> socialList [

	^ socialList
]

{ #category : #accessing }
CMSpEntitiesPresenter >> socialList: anObject [

	socialList := anObject
]

{ #category : #'accessing - helpers' }
CMSpEntitiesPresenter >> socialTreePresenter [

	^ self socialList classTreePresenter
]

{ #category : #accessing }
CMSpEntitiesPresenter >> spatialList [

	^ spatialList
]

{ #category : #accessing }
CMSpEntitiesPresenter >> spatialList: anObject [

	spatialList := anObject
]

{ #category : #'accessing - helpers' }
CMSpEntitiesPresenter >> spatialTreePresenter [

	^ self spatialList classTreePresenter
]

{ #category : #callbacks }
CMSpEntitiesPresenter >> updateSelectedClass: newTopClass [

	self classPath: (self instantiate: CMClassPathPresenter on: newTopClass).
	self selectedClass: newTopClass.
	self update.
]

{ #category : #enumerating }
CMSpEntitiesPresenter >> whenSelectedItemChangedDo: aBlock [
	"Inform when selected index has changed. 
	 `aBlock` receives one optional argument (the new element)."
	
	self spatialTreePresenter whenSelectionChangedDo: aBlock.
	self passiveTreePresenter whenSelectionChangedDo: aBlock.
	self socialTreePresenter whenSelectionChangedDo: aBlock.

]
