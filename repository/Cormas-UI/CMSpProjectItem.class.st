Class {
	#name : #CMSpProjectItem,
	#superclass : #CMObject,
	#category : #'Cormas-UI-Spec2-ProjectBrowser'
}

{ #category : #accessing }
CMSpProjectItem class >> icon [ 
	^ self iconProvider propertiesIcon 
]

{ #category : #accessing }
CMSpProjectItem class >> iconProvider [ 

	^ CMIconCache 
]

{ #category : #accessing }
CMSpProjectItem class >> label [

	^ 'CORMAS Project'
]

{ #category : #'instance creation' }
CMSpProjectItem class >> on: aString [ 

	^ self new
		label: aString;
		yourself
]

{ #category : #accessing }
CMSpProjectItem >> icon [

	^ self class icon
]
