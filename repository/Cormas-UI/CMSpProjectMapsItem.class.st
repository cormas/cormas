Class {
	#name : #CMSpProjectMapsItem,
	#superclass : #CMSpProjectResourcesItem,
	#category : #'Cormas-UI-Spec2-ProjectBrowser'
}

{ #category : #accessing }
CMSpProjectMapsItem class >> icon [

	^ self iconNamed: #worldIcon
]

{ #category : #accessing }
CMSpProjectMapsItem class >> label [

	^ 'Maps'
]

{ #category : #initialization }
CMSpProjectMapsItem >> folderFileReference [

	^ super folderFileReference / 'maps'
]
