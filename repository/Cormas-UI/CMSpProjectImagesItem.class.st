Class {
	#name : #CMSpProjectImagesItem,
	#superclass : #CMSpProjectResourcesItem,
	#category : #'Cormas-UI-Spec2-ProjectBrowser'
}

{ #category : #accessing }
CMSpProjectImagesItem class >> icon [

	^ self iconNamed: #imageIcon
]

{ #category : #accessing }
CMSpProjectImagesItem class >> label [

	^ 'Images'
]

{ #category : #initialization }
CMSpProjectImagesItem >> folderFileReference [

	^ super folderFileReference / 'images'
]
