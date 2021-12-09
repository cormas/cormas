Class {
	#name : #CMSpProjectDocumentationItem,
	#superclass : #CMSpProjectResourcesItem,
	#category : #'Cormas-UI-Spec2-ProjectBrowser'
}

{ #category : #accessing }
CMSpProjectDocumentationItem class >> label [

	^ 'Documentation'
]

{ #category : #initialization }
CMSpProjectDocumentationItem >> folderFileReference [

	^ super folderFileReference / 'doc'
]
