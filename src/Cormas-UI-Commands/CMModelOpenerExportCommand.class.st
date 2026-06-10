Class {
	#name : 'CMModelOpenerExportCommand',
	#superclass : 'CMModelOpenerCommand',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'accessing' }
CMModelOpenerExportCommand class >> order [

	^ 50
]

{ #category : 'action' }
CMModelOpenerExportCommand >> action [

	(StSaveFilePresenter extensions: {'cmx'})
		okAction: [ :fileReference | 
			owner cormasModelClass saveToFile: fileReference.
			self informSaved: fileReference ]
]

{ #category : 'accessing' }
CMModelOpenerExportCommand >> icon [

	^ self iconNamed: #save
]

{ #category : 'action' }
CMModelOpenerExportCommand >> informSaved: aFileReference [

	MorphicUIManager new
		inform: (String streamContents: [ :stream |
			stream
				nextPutAll: 'Model saved: ';
				nextPutAll: aFileReference pathString;
				cr;
				nextPutAll: 'Click to open location' ])
		actionOnClick: [ aFileReference parent openInOSFileBrowser ]
]

{ #category : 'accessing' }
CMModelOpenerExportCommand >> name [

	^ 'Export'
]
