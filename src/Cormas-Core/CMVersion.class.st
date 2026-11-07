"
I am a version of Cormas, such as 1.0.0 or 1.0.0-dev.

## Responsibility

- I know my major, minor and patch numbers, and whether I am a version in development.
- I give the catalog line I belong to: `dev` for a version in development, otherwise my major.
- I know the version of this Cormas.

## Collaborators

- The workspace reads my line to choose the catalog of example models.

## Public API and Key Messages

- `CMVersion current` returns the version of this Cormas. The dev branch holds the next release followed by -dev.
- `CMVersion fromString:` reads a version written as major.minor or major.minor.patch, optionally followed by -dev.
- `line`, `major`, `minor`, `patch`, `isDev`.

```
(CMVersion fromString: '1.2.3') line. ""'1'""
CMVersion current line. ""'dev' until 1.0.0 is released""
```

## Internal Representation

- `major`, `minor`, `patch`: integers, the patch being 0 when it is not written.
- `isDev`: true for a version in development.
"
Class {
	#name : 'CMVersion',
	#superclass : 'Object',
	#instVars : [
		'major',
		'minor',
		'patch',
		'isDev'
	],
	#category : 'Cormas-Core-Kernel',
	#package : 'Cormas-Core',
	#tag : 'Kernel'
}

{ #category : 'instance creation' }
CMVersion class >> current [
	"Return the version of this Cormas. The dev branch holds the next release followed by -dev, and a release changes it"

	^ self fromString: '1.0.0-dev'
]

{ #category : 'instance creation' }
CMVersion class >> fromString: aString [
	"Return the version written as major.minor, or major.minor.patch, optionally followed by -dev, such as '1.0.0-dev'. Raise an error for anything else"

	| matcher |
	matcher := '(\d+)\.(\d+)(\.(\d+))?(-dev)?' asRegex.
	(matcher matches: aString) ifFalse: [
			^ self error: aString printString
				  , ' is not a Cormas version, such as 1.0.0 or 1.0.0-dev' ].
	^ self new
		  setMajor: (matcher subexpression: 2) asNumber
		  minor: (matcher subexpression: 3) asNumber
		  patch: ((matcher subexpression: 5)
				   ifNil: [ 0 ]
				   ifNotNil: [ :patch | patch asNumber ])
		  isDev: (matcher subexpression: 6) notNil
]

{ #category : 'accessing' }
CMVersion >> isDev [

	^ isDev
]

{ #category : 'comparing' }
CMVersion >> isNoNewerThan: aVersion [
	"Return whether I am the same or an older major and minor than aVersion, ignoring patches and -dev: a model made with 1.0-dev runs in 1.0.0"

	^ major < aVersion major or: [
		  major = aVersion major and: [ minor <= aVersion minor ] ]
]

{ #category : 'comparing' }
CMVersion >> isWithinTheMajorOf: aVersion [
	"Return whether I am the same major as aVersion and no newer minor: a model made with me runs in aVersion without a warning"

	^ major = aVersion major and: [ minor <= aVersion minor ]
]

{ #category : 'accessing' }
CMVersion >> line [
	"Return the catalog line of this version: dev for a version in development, otherwise its major, such as 1 for every 1.x.y release"

	^ isDev
		  ifTrue: [ 'dev' ]
		  ifFalse: [ major printString ]
]

{ #category : 'accessing' }
CMVersion >> major [

	^ major
]

{ #category : 'printing' }
CMVersion >> majorMinorString [
	"Return the version without its patch, such as 1.2 or 1.0-dev: what a model records as the Cormas it was made with"

	^ String streamContents: [ :stream |
			  stream
				  print: major;
				  nextPut: $.;
				  print: minor.
			  isDev ifTrue: [ stream nextPutAll: '-dev' ] ]
]

{ #category : 'accessing' }
CMVersion >> minor [

	^ minor
]

{ #category : 'accessing' }
CMVersion >> patch [

	^ patch
]

{ #category : 'printing' }
CMVersion >> printOn: aStream [

	aStream
		print: major;
		nextPut: $.;
		print: minor;
		nextPut: $.;
		print: patch.
	isDev ifTrue: [ aStream nextPutAll: '-dev' ]
]

{ #category : 'private' }
CMVersion >> setMajor: aMajor minor: aMinor patch: aPatch isDev: aBoolean [

	major := aMajor.
	minor := aMinor.
	patch := aPatch.
	isDev := aBoolean
]
