"
Implements support for Spec2 presenters to be used with a CORMAS model.

To use it just set an instance of this class as the owner of the target (Spec2) presenter.

"
Class {
	#name : #CMModelSpPresenter,
	#superclass : #CMSpPresenter,
	#instVars : [
		'cormasModel'
	],
	#category : #'Cormas-UI-Spec2'
}

{ #category : #'instance creation' }
CMModelSpPresenter class >> for: aCMProjectManager [ 
	" Answer a new instance of the receiver using aCMProjectManager as model "
	
	^ self basicNew 
		projectManager: aCMProjectManager;
		initialize;
		yourself
]

{ #category : #'instance creation' }
CMModelSpPresenter class >> openFor: aCMProjectManager [ 
	" Create and open a new instance of the receiver, configuring its controller with aCMProjectManager"

	^ (self for: aCMProjectManager)
		openWithSpec;
		centered;
		yourself
]

{ #category : #'instance creation' }
CMModelSpPresenter class >> openOn: aCormasModel [
	" Open the receiver using aCormasModel as Spec2 presenter model "
	
	^ (self on: aCormasModel) openWithSpec
]

{ #category : #accessing }
CMModelSpPresenter >> cormasClass [ 
	" Answer the <Class> representing the receiver's cormas model class "
	
	^ self cormasModel class
]

{ #category : #accessing }
CMModelSpPresenter >> cormasModel [
	" Answer a <CMAbstractModel>, the receiver's cormas model "

	^ cormasModel
]

{ #category : #accessing }
CMModelSpPresenter >> cormasModel: anObject [

	cormasModel := anObject
]

{ #category : #accessing }
CMModelSpPresenter >> cormasModelClass [ 
	" Answer the <Class> representing the receiver's cormas model class "
	
	^ self cormasModel class
]

{ #category : #accessing }
CMModelSpPresenter >> currentProject [
	" Answer the receiver's <CMProjectModel> "

	^ self projectManager currentProject
]

{ #category : #initialization }
CMModelSpPresenter >> projectManager [ 
	" Answer the receiver's <CMProjectManager> "

	^ self cormasModel projectManager
]

{ #category : #initialization }
CMModelSpPresenter >> setModelBeforeInitialization: aDomainObject [

	self cormasModel: aDomainObject
]
