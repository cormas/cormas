"
I save what a modeler exports from a simulation, such as a picture of the space, a chart or the data of the probes. I put it in the output folder of the model, under a name made of what it is and the time, so that exporting twice never replaces a file, and I tell the modeler where it went.

## Responsibility:

- I choose the file: a new one in the output folder of the model, or, for a model not installed from the workspace, the one the modeler chooses in a save dialog.
- I have the export written into that file.
- I tell the modeler where the file is; clicking the message opens its folder.

## Collaborators:

- `CMModel class>>newOutputFileNamed:extension:` gives the new file in the output folder.
- `StSaveFilePresenter` asks where to save, when there is no output folder.
- The space, chart and data presenters use me for their export buttons.

## Public API and Key Messages

- `CMExport of: aModelClass named: aName extension: anExtension writing: aBlock` exports, aBlock taking the file to write.

```smalltalk
CMExport
	of: FireModel
	named: 'data'
	extension: 'csv'
	writing: [ :file | file writeStreamDo: [ :stream | stream nextPutAll: 'step,trees' ] ]
```
"
Class {
	#name : 'CMExport',
	#superclass : 'Object',
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'exporting' }
CMExport class >> of: aModelClass named: aName extension: anExtension writing: aBlock [
	"Have aBlock write an export into a new file of the output folder of the model, named after aName and the time, then tell where it went. A model not installed from the workspace has no output folder: ask where to save instead"

	| file |
	file := [
	        aModelClass newOutputFileNamed: aName extension: anExtension ]
		        on: CMWorkspaceError
		        do: [
				        ^ (StSaveFilePresenter extensions: { anExtension })
					          okAction: [ :chosen |
							          aBlock value: chosen.
							          self tellSavedTo: chosen ] ].
	aBlock value: file.
	self tellSavedTo: file
]

{ #category : 'exporting' }
CMExport class >> tellSavedTo: aFile [

	UIManager default
		inform: 'Saved to ' , aFile fullName , String cr , String cr
			, 'Click to open its folder'
		actionOnClick: [ aFile parent openInOSFileBrowser ]
]
