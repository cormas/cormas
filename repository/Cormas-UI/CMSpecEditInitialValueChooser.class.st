Class {
	#name : #CMSpecEditInitialValueChooser,
	#superclass : #CMSpecInitialValueChooser,
	#instVars : [
		'editedValue'
	],
	#category : #'Cormas-UI-Spec1-Attributes'
}

{ #category : #'instance creation' }
CMSpecEditInitialValueChooser class >> on: attributeSpec for: aCMProjectManager owner: aPresenter [

	(self for: aCMProjectManager)
		owner: aPresenter;	
		attributeName: attributeSpec attributeAsString;
		openWithSpec;
		editedValue: attributeSpec currentValue
]

{ #category : #accessing }
CMSpecEditInitialValueChooser >> editedValue [

	^ editedValue
]

{ #category : #accessing }
CMSpecEditInitialValueChooser >> editedValue: anObject [

	self initialRBGroup edit: anObject.
	editedValue := anObject.
	
]

{ #category : #initialization }
CMSpecEditInitialValueChooser >> setInitialValue: anObject [ 
	
	self codeGenerator 
		createAttribute: self attributeName 
		defaultValue: anObject.
	self updateDataSource.
	self delete.
]
