Class {
	#name : 'CMModelOpenerDocumentationCommand',
	#superclass : 'CMModelOpenerCommand',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'accessing' }
CMModelOpenerDocumentationCommand class >> order [
	
	^ 30
]

{ #category : 'action' }
CMModelOpenerDocumentationCommand >> action [

	WebBrowser openOn: owner cormasModelClass documentationUrl
]

{ #category : 'accessing' }
CMModelOpenerDocumentationCommand >> icon [

	^ self iconNamed: #remote
]

{ #category : 'testing' }
CMModelOpenerDocumentationCommand >> isAvailable [

	^ owner cormasModelClass documentationUrl isNotNil
]

{ #category : 'accessing' }
CMModelOpenerDocumentationCommand >> name [

	^ 'Documentation'
]
