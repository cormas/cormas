Class {
	#name : 'CMModelOpenerGithubCommand',
	#superclass : 'CMModelOpenerCommand',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'accessing' }
CMModelOpenerGithubCommand class >> order [

	^ 20
]

{ #category : 'action' }
CMModelOpenerGithubCommand >> action [

	WebBrowser openOn: owner cormasModelClass githubUrl
]

{ #category : 'accessing' }
CMModelOpenerGithubCommand >> icon [

	^ self iconNamed: #github
]

{ #category : 'testing' }
CMModelOpenerGithubCommand >> isAvailable [

	^ owner cormasModelClass hasGithubUrl
]

{ #category : 'accessing' }
CMModelOpenerGithubCommand >> name [

	^ 'GitHub'
]
