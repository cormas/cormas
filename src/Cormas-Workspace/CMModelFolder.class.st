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
- `baselineName` and `summary` read `cormas.json`.
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
