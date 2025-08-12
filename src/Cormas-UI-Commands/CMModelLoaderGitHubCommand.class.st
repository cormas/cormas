Class {
	#name : 'CMModelLoaderGitHubCommand',
	#superclass : 'CMModelLoaderCommand',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'action' }
CMModelLoaderGitHubCommand >> action [

	WebBrowser openOn: owner manifest githubUrl
]

{ #category : 'accessing' }
CMModelLoaderGitHubCommand >> icon [

	^ self iconNamed: #github
]

{ #category : 'accessing' }
CMModelLoaderGitHubCommand >> name [

	^ 'Open on GitHub'
]
