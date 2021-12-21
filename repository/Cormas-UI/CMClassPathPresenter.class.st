Class {
	#name : #CMClassPathPresenter,
	#superclass : #CMSpPresenter,
	#instVars : [
		'topClass'
	],
	#category : #'Cormas-UI-Spec2-Entities'
}

{ #category : #examples }
CMClassPathPresenter class >> example [
	^ (self on: SystemDictionary) openWithSpec
]

{ #category : #initialization }
CMClassPathPresenter >> addPathDelimiter [

	self layout isEmpty ifFalse: [ 
		self layout add: (self newLabel label: ' > ') expand: false ].
]

{ #category : #initialization }
CMClassPathPresenter >> addPathElement: cls [

	self layout 
		add: (self newLink 
			label: cls asString;
			action: [ cls browse ]) 
		expand: false
]

{ #category : #initialization }
CMClassPathPresenter >> initializeLayout [

	self topClass withAllSuperclasses reversed do: [ : cls |.
		self 
			addPathDelimiter; 
			addPathElement: cls ]
]

{ #category : #initialization }
CMClassPathPresenter >> initializePresenters [

	self layout: SpBoxLayout newLeftToRight.
	self initializeLayout.
]

{ #category : #initialization }
CMClassPathPresenter >> setModelBeforeInitialization: aClass [

	topClass := aClass
]

{ #category : #accessing }
CMClassPathPresenter >> topClass [

	^ topClass
]
