Class {
	#name : #CMSpecEditInitialValueChooser,
	#superclass : #CMSpecInitialValueChooser,
	#instVars : [
		'editedValue',
		'isMetaEdit'
	],
	#category : #'Cormas-UI-Spec1-Attributes'
}

{ #category : #'instance creation' }
CMSpecEditInitialValueChooser class >> on: attributeSpec for: aCMProjectManager owner: aPresenter [

	(self for: aCMProjectManager)
		owner: aPresenter;	
		isMetaEdit: false;			
		attributeName: attributeSpec attributeAsString;
		openWithSpec;
		editedValue: attributeSpec currentValue
]

{ #category : #'instance creation' }
CMSpecEditInitialValueChooser class >> onClass: attributeSpec for: aCMProjectManager owner: aPresenter [

	(self for: aCMProjectManager)
		owner: aPresenter;	
		isMetaEdit: true;
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

{ #category : #accessing }
CMSpecEditInitialValueChooser >> isMetaEdit [

	^ isMetaEdit
]

{ #category : #accessing }
CMSpecEditInitialValueChooser >> isMetaEdit: anObject [

	isMetaEdit := anObject
]

{ #category : #initialization }
CMSpecEditInitialValueChooser >> setInitialValue: anObject [ 
	
	self isMetaEdit
		ifTrue: [ self codeGenerator isMeta: false  ].
	self codeGenerator 
		createAttribute: self attributeName 
		defaultValue: anObject.
	self updateDataSource.
	self delete.
]
