Class {
	#name : 'CMModelLoaderGithubCommand',
	#superclass : 'CMModelLoaderCommand',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'action' }
CMModelLoaderGithubCommand >> action [

	WebBrowser openOn: owner manifest githubUrl
]

{ #category : 'accessing' }
CMModelLoaderGithubCommand >> icon [

	^ self iconNamed: #github
]

{ #category : 'accessing' }
CMModelLoaderGithubCommand >> name [

	^ 'Open on GitHub'
]
