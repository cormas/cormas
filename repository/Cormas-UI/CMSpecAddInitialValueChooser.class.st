Class {
	#name : #CMSpecAddInitialValueChooser,
	#superclass : #CMSpecInitialValueChooser,
	#category : #'Cormas-UI-Spec1-Attributes'
}

{ #category : #accessing }
CMSpecAddInitialValueChooser >> setInitialValue: anObject [ 
	
	self codeGenerator 
		createAttribute: self attributeName 
		defaultValue: anObject.
	self openBrowserAt: self targetClass selector: self attributeName.
	self updateDataSource.
	self delete.
]
