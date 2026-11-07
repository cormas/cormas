"
I represent one folder directly inside the `Models` or `Examples` folder of a workspace. I may be a model or not, so that the modeler sees every folder and why it is not a model.

## Responsibility:

- I tell whether my folder is a model: it is if and only if it contains `cormas.json`.
- I read `cormas.json`: the name of the baseline that loads the model, which is its identity, and the summary shown in the catalog.
- I recognise the usual mistake of a zip extracted into a folder of the same name, where the model is one level down.

## Collaborators:

- `CMWorkspace` creates me for each of its folders and tells me where its `Examples` folder is.
- `CMWorkspaceError` is what I raise when `cormas.json` cannot be read.

## Public API and Key Messages

- `CMModelFolder in: aWorkspace at: aFileReference` creates an instance; usually `CMWorkspace>>folders` does it.
- `isModel`, `isExample` and `hasModelOneLevelDown` describe the folder.
- `baselineName` and `summary` read `cormas.json`; `hasBaselineNamed:` tells whether I am the folder of a given model, and is false when `cormas.json` cannot be read.
- `name` is the name of the folder, which can be anything.

For example, to list the models of the image's workspace with their baseline:

```smalltalk
(CMWorkspace current folders select: [ :each | each isModel ])
	collect: [ :each | each name -> each baselineName ]
```

## Internal Representation

- `workspace` is the `CMWorkspace` I belong to.
- `location` is the `FileReference` of my folder.

### Implementation Points

- I read `cormas.json` every time, so I always show what is on disk now. A file that is not a JSON object, or has no `""baseline""`, raises a `CMWorkspaceError` naming the folder and the reason.
"
Class {
	#name : 'CMModelFolder',
	#superclass : 'Object',
	#instVars : [
		'workspace',
		'location'
	],
	#category : 'Cormas-Workspace',
	#package : 'Cormas-Workspace'
}

{ #category : 'instance creation' }
CMModelFolder class >> in: aWorkspace at: aFileReference [

	^ self new setWorkspace: aWorkspace location: aFileReference
]

{ #category : 'accessing' }
CMModelFolder >> baselineName [
	"Return the name of the baseline that loads the model, as written in cormas.json. It is the identity of the model: the name of the folder does not matter"

	^ self metadata
		  at: 'baseline'
		  ifAbsent: [ self invalidCormasJson: 'it has no "baseline"' ]
]

{ #category : 'private' }
CMModelFolder >> cormasJson [

	^ location / 'cormas.json'
]

{ #category : 'testing' }
CMModelFolder >> hasBaselineNamed: aBaselineName [
	"Answer whether I am a model with that baseline. A folder whose cormas.json cannot be read is no model's folder"

	^ self isModel and: [
			  [ self baselineName = aBaselineName ]
				  on: CMWorkspaceError
				  do: [ false ] ]
]

{ #category : 'testing' }
CMModelFolder >> hasModelOneLevelDown [
	"Answer whether I am not a model but my only folder is one, as happens when a zip is extracted into a folder of the same name"

	| subfolders |
	self isModel ifTrue: [ ^ false ].
	subfolders := location directories.
	^ subfolders size = 1 and: [
		  (self class in: workspace at: subfolders first) isModel ]
]

{ #category : 'private' }
CMModelFolder >> invalidCormasJson: aReason [

	CMWorkspaceError signal:
		'cormas.json in ' , location fullName , ' is not valid: ' , aReason
]

{ #category : 'testing' }
CMModelFolder >> isExample [

	^ location parent = workspace examplesFolder
]

{ #category : 'testing' }
CMModelFolder >> isModel [
	"A folder is a model if and only if it contains cormas.json"

	^ self cormasJson isFile
]

{ #category : 'accessing' }
CMModelFolder >> location [

	^ location
]

{ #category : 'accessing' }
CMModelFolder >> madeWith [
	"Return the version of Cormas the model was made with, as written in cormas.json, or nil when it is not recorded"

	| version |
	version := self metadata at: 'cormas' ifAbsent: [ ^ nil ].
	^ [ CMVersion fromString: version ]
		  on: Error
		  do: [ :error | self invalidCormasJson: error messageText ]
]

{ #category : 'private' }
CMModelFolder >> metadata [

	| json |
	json := [ STONJSON fromString: self cormasJson contents ]
		        on: STONReaderError
		        do: [ :error | self invalidCormasJson: error messageText ].
	json isDictionary ifFalse: [
		self invalidCormasJson: 'it is not a JSON object' ].
	^ json
]

{ #category : 'accessing' }
CMModelFolder >> name [

	^ location basename
]

{ #category : 'accessing' }
CMModelFolder >> recordMadeWith: aVersion [
	"Record in cormas.json that the model is now made with this version of Cormas, when it was made with the same major or when nothing was recorded. Across majors nothing changes: moving a model to another major is the modeler's decision"

	| madeWith metadata |
	madeWith := self madeWith.
	(madeWith isNil or: [ madeWith major = aVersion major ]) ifFalse: [
		^ self ].
	metadata := self metadata.
	(metadata at: 'cormas' ifAbsent: [ nil ]) = aVersion majorMinorString
		ifTrue: [ ^ self ].
	metadata at: 'cormas' put: aVersion majorMinorString.
	self writeMetadata: metadata
]

{ #category : 'initialization' }
CMModelFolder >> setWorkspace: aWorkspace location: aFileReference [

	workspace := aWorkspace.
	location := aFileReference
]

{ #category : 'accessing' }
CMModelFolder >> summary [
	"Return the paragraph that describes the model in the catalog, empty when cormas.json has none"

	^ self metadata at: 'summary' ifAbsent: [ '' ]
]

{ #category : 'private' }
CMModelFolder >> writeMetadata: aDictionary [
	"Write cormas.json with the fields in the order Cormas creates them, then the others sorted, so that rewriting it changes as few lines as possible"

	| ordered |
	ordered := OrderedDictionary new.
	#( 'baseline' 'summary' 'cormas' ) do: [ :key |
		aDictionary
			at: key
			ifPresent: [ :value | ordered at: key put: value ] ].
	(aDictionary keys asSortedCollection reject: [ :key |
		 ordered includesKey: key ]) do: [ :key |
		ordered at: key put: (aDictionary at: key) ].
	self cormasJson ensureDelete.
	self cormasJson writeStreamDo: [ :stream |
		STONJSON put: ordered onStreamPretty: stream ]
]
