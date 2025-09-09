Class {
	#name : 'CMModelLoaderLoadCommand',
	#superclass : 'CMModelLoaderCommand',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'action' }
CMModelLoaderLoadCommand >> action [ 

	self isCormasDevVersion
		ifTrue: [ owner manifest loadDev ]
		ifFalse: [ owner manifest load ].
		
	owner signalUpdate
]

{ #category : 'accessing' }
CMModelLoaderLoadCommand >> icon [ 

	^ self iconNamed: #smallLoadProject
]

{ #category : 'testing' }
CMModelLoaderLoadCommand >> isAvailable [

	^ owner manifest isLoaded not
]

{ #category : 'testing' }
CMModelLoaderLoadCommand >> isCormasDevVersion [

	| httpsUrl sshUrl cormasRepo |
	
	httpsUrl := 'https://github.com/cormas/cormas.git'.
	sshUrl := 'git@github.com:cormas/cormas.git'.

	cormasRepo := IceRepository registry
		detect: [ :repo | repo remotes anySatisfy: [ :remote |
				{ httpsUrl . sshUrl } includes: remote url ] ]
		ifNone: [ self error: 'Cormas repository was not found!' ].
		
	^ cormasRepo branch name = 'dev'

]

{ #category : 'accessing' }
CMModelLoaderLoadCommand >> name [

	^ 'Load'
]
