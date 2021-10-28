"
Implements support for Spec2 presenters.

To use it just set an instance of this class as the owner of the target (Spec2) presenter.

"
Class {
	#name : #CMSpPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'cormasModel'
	],
	#category : #'Cormas-UI-Spec2'
}

{ #category : #'instance creation' }
CMSpPresenter class >> for: aCMProjectManager [ 
	" Answer a new instance of the receiver using aCMProjectManager as model "
	
	^ self basicNew 
		projectManager: aCMProjectManager;
		initialize;
		yourself
]

{ #category : #'instance creation' }
CMSpPresenter class >> openFor: aCMProjectManager [ 
	" Create and open a new instance of the receiver, configuring its controller with aCMProjectManager"

	^ (self for: aCMProjectManager)
		openWithSpec;
		centered;
		yourself
]

{ #category : #'instance creation' }
CMSpPresenter class >> openOn: aCormasModel [
	" Open the receiver using aCormasModel as Spec2 presenter model "
	
	^ (self on: aCormasModel) openWithSpec
]

{ #category : #accessing }
CMSpPresenter >> application [
	" Answer a Spec2 application object "

	^ CMSpApplication new
			useBackend: #Morphic with: self styleConfiguration;
			yourself
]

{ #category : #accessing }
CMSpPresenter >> cormasClass [ 
	" Answer the <Class> representing the receiver's cormas model class "
	
	^ self cormasModel class
]

{ #category : #accessing }
CMSpPresenter >> cormasModel [
	" Answer a <CMAbstractModel>, the receiver's cormas model "

	^ cormasModel
]

{ #category : #accessing }
CMSpPresenter >> cormasModel: anObject [

	cormasModel := anObject
]

{ #category : #accessing }
CMSpPresenter >> cormasModelClass [ 
	" Answer the <Class> representing the receiver's cormas model class "
	
	^ self cormasModel class
]

{ #category : #accessing }
CMSpPresenter >> currentProject [
	" Answer the receiver's <CMProjectModel> "

	^ self projectManager currentProject
]

{ #category : #initialization }
CMSpPresenter >> initialize [

	super initialize.
	application := CMSpApplication new
]

{ #category : #initialization }
CMSpPresenter >> projectManager [ 
	" Answer the receiver's <CMProjectManager> "

	^ self cormasModel projectManager
]

{ #category : #initialization }
CMSpPresenter >> setModelBeforeInitialization: aDomainObject [

	self cormasModel: aDomainObject
]

{ #category : #accessing }
CMSpPresenter >> styleConfiguration [ 
	" Private - Use a generic default style configuration for Morphic backend "

	^ SpMorphicConfiguration new
]

{ #category : #accessing }
CMSpPresenter >> translator [
	" Answer the project <PFTranslator> "

	^ self projectManager translator
]

{ #category : #accessing }
CMSpPresenter >> translator: aPFTranslator [
	" Answer the project <PFTranslator> "

	^ self projectManager translator: aPFTranslator
]
