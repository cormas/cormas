Class {
	#name : 'CMSaveToCsvCommand',
	#superclass : 'CMDataPresenterCommand',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'accessing' }
CMSaveToCsvCommand >> action [

	<category: 'actions'>
	| fileReference |
	fileReference := UIManager default
		                 chooseForSaveFileReference: 'Save simulation data'
		                 extensions: #( 'csv' )
		                 path: FileSystem workingDirectory.

	fileReference ifNotNil: [ self saveDataToFile: fileReference ]
]

{ #category : 'accessing' }
CMSaveToCsvCommand >> icon [

	^ CMIcons csvIcon
]

{ #category : 'accessing' }
CMSaveToCsvCommand >> name [

	^ translator tSaveToCsv
]
