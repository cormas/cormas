"
A lightweight descriptor of a Cormas model containing metadata such as name, description, screenshot, and source URL. This object serves as a manifest for locating and loading the full model without storing or preloading its complete data
"
Class {
	#name : 'CMModelManifest',
	#superclass : 'Object',
	#category : 'Cormas-Core',
	#package : 'Cormas-Core'
}

{ #category : 'parameters' }
CMModelManifest class >> aboutThisModel [

	self subclassResponsibility
]

{ #category : 'parameters' }
CMModelManifest class >> baselineName [

	self subclassResponsibility
]

{ #category : 'repository - loading' }
CMModelManifest class >> delete [

	| repo |
	repo := self iceRepository.
	repo unload.
	repo delete
]

{ #category : 'url' }
CMModelManifest class >> githubLink [

	^ String streamContents: [ :stream |
		stream
			<< 'github://'
			<< self githubOrganizationName
			<< '/'
			<< self githubRepositoryName
			<< ':main' ]
]

{ #category : 'constants' }
CMModelManifest class >> githubOrganizationName [

	^ 'cormas'
]

{ #category : 'parameters' }
CMModelManifest class >> githubRepositoryName [

	self subclassResponsibility
]

{ #category : 'url' }
CMModelManifest class >> githubUrl [

	^ String streamContents: [ :stream |
		stream
			<< 'https://github.com/'
			<< self githubOrganizationName
			<< '/'
			<< self githubRepositoryName ]
]

{ #category : 'url' }
CMModelManifest class >> httpsUrl [

	^ self githubUrl, '.git'
]

{ #category : 'repository - detecting' }
CMModelManifest class >> iceRepository [

	^ self iceRepositoryIfNotFound: [ 
		self error: 'Repository of ', self modelName, ' was not found!' ]
]

{ #category : 'repository - detecting' }
CMModelManifest class >> iceRepositoryIfNotFound: aBlock [

	^ IceRepository registry
		detect: [ :repo | repo remotes anySatisfy: [ :remote |
				{ self httpsUrl . self sshUrl } includes: remote url ] ]
		ifNone: aBlock
]

{ #category : 'testing' }
CMModelManifest class >> isLoaded [

	self iceRepositoryIfNotFound: [ ^ false ].
	^ true
]

{ #category : 'repository - loading' }
CMModelManifest class >> load [
	"Clone repository and install model into the image"
	Metacello new
		baseline: self baselineName;
		repository: self githubLink;
		load
]

{ #category : 'parameters' }
CMModelManifest class >> modelName [

	self subclassResponsibility
]

{ #category : 'accessing' }
CMModelManifest class >> screenshot [

	^ Form fromBinaryStream: self screenshotContents base64Decoded asByteArray readStream
]

{ #category : 'parameters' }
CMModelManifest class >> screenshotContents [

	self subclassResponsibility
]

{ #category : 'url' }
CMModelManifest class >> sshUrl [

	^ String streamContents: [ :stream |
		stream
			<< 'git@github.com:'
			<< self githubOrganizationName
			<< '/'
			<< self githubRepositoryName
			<< '.git' ]
]

{ #category : 'see class side' }
CMModelManifest >> seeClassSide [ 
]
