Class {
	#name : 'CMModelPreviewPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'cormasModelClass',
		'screenshot',
		'modelDescription'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'examples' }
CMModelPreviewPresenter class >> example [
	<example>
	(self forModelClass: CMMockModel) open
]

{ #category : 'instance creation' }
CMModelPreviewPresenter class >> forModelClass: aClass [

	^ self on: aClass
]

{ #category : 'as yet unclassified' }
CMModelPreviewPresenter class >> screenshotSize [
	"Width and height of screenshot in pixels"
	^ 400
]

{ #category : 'layout' }
CMModelPreviewPresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		hAlignCenter;
		add: (SpBoxLayout newTopToBottom
			add: screenshot expand: false;
			add: modelDescription;
			yourself) width: self class screenshotSize;
		yourself
]

{ #category : 'examples' }
CMModelPreviewPresenter >> example [
	<script: 'self example'>
	
]

{ #category : 'initialization' }
CMModelPreviewPresenter >> initializePresenters [

	screenshot := self newImage
		"autoScale: true;"
		yourself.

	modelDescription := self instantiate: MicrodownPresenter.
	
	self initializeWithModelClass
]

{ #category : 'initialization' }
CMModelPreviewPresenter >> initializeWithModelClass [

	| image descriptionWithTitle |

	image := cormasModelClass screenshot
		scaledToSize: self class screenshotSize @ self class screenshotSize.
	
	screenshot image: image.
	
	descriptionWithTitle := String streamContents: [ :stream |
		stream
			nextPut: $#;
			nextPutAll: cormasModelClass modelName;
			cr;
			nextPutAll: cormasModelClass aboutThisModel ].
		
	modelDescription documentFromString: descriptionWithTitle
]

{ #category : 'accessing - model' }
CMModelPreviewPresenter >> setModelBeforeInitialization: aClass [

	cormasModelClass := aClass
]
