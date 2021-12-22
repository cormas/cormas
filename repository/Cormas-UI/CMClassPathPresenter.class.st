Class {
	#name : #CMClassPathPresenter,
	#superclass : #CMSpPresenter,
	#instVars : [
		'topClass'
	],
	#category : #'Cormas-UI-Spec2-Entities'
}

{ #category : #examples }
CMClassPathPresenter class >> example1 [
	^ (self on: SystemDictionary) openWithSpec
]

{ #category : #examples }
CMClassPathPresenter class >> example2 [
	^ (self on: String empty) openWithSpec
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
			help: cls comment;
			action: [ cls browse ]) 
		expand: false
]

{ #category : #initialization }
CMClassPathPresenter >> initializeLayout [

	self topClass isClassOrTrait
		ifTrue: [ 
			self topClass withAllSuperclasses reversed do: [ : cls |.
			self 
				addPathDelimiter; 
				addPathElement: cls ] ]
		ifFalse: [ self layout add: (self newLabel label: 'no selection') expand: false ]
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
