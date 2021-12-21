Class {
	#name : #CMProjectSpPresenter,
	#superclass : #CMSpPresenter,
	#instVars : [
		'projectManager'
	],
	#category : #'Cormas-UI-Spec2'
}

{ #category : #accessing }
CMProjectSpPresenter class >> currentApplication [ 

	^ CMSpApplication defaultApplication
]

{ #category : #'instance creation' }
CMProjectSpPresenter class >> for: aCMProjectManager [ 
	" Answer a new instance of the receiver using aCMProjectManager as model "
	
	^ self basicNew 
		setModelBeforeInitialization: aCMProjectManager;
		initialize;
		yourself
]

{ #category : #'instance creation' }
CMProjectSpPresenter class >> openFor: aCMProjectManager [ 
	" Create and open a new instance of the receiver, configuring its controller with aCMProjectManager"

	^ (self for: aCMProjectManager)
		openWithSpec;
		centered;
		yourself
]

{ #category : #'instance creation' }
CMProjectSpPresenter class >> openOn: aCormasModel [
	" Open the receiver using aCormasModel as Spec2 presenter model "
	
	^ (self on: aCormasModel) openWithSpec
]

{ #category : #accessing }
CMProjectSpPresenter >> cormasClass [ 
	" Answer the <Class> representing the receiver's cormas model class "
	
	^ self cormasModel class
]

{ #category : #accessing }
CMProjectSpPresenter >> cormasModel [

	^ self projectManager cormasModel.
]

{ #category : #accessing }
CMProjectSpPresenter >> cormasModelClass [ 
	" Answer the <Class> representing the receiver's cormas model class "
	
	^ self cormasModel class
]

{ #category : #accessing }
CMProjectSpPresenter >> currentProject [
	" Answer the receiver's <CMProjectModel> "

	^ self projectManager currentProject
]

{ #category : #'accessing - entities' }
CMProjectSpPresenter >> passiveClasses [

	^ self cormasModelClass passiveClasses asArray
]

{ #category : #accessing }
CMProjectSpPresenter >> projectManager [
	" Answer the receiver's <CMProjectManager> "

	^ projectManager
]

{ #category : #accessing }
CMProjectSpPresenter >> projectManager: anObject [

	projectManager := anObject
]

{ #category : #initialization }
CMProjectSpPresenter >> setModelBeforeInitialization: aDomainObject [

	self projectManager: aDomainObject
]

{ #category : #'accessing - entities' }
CMProjectSpPresenter >> socialClasses [

	^ self cormasModelClass socialClasses asArray
]

{ #category : #'accessing - entities' }
CMProjectSpPresenter >> spatialClasses [

	^ self cormasModelClass spatialClasses asArray
]
