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

{ #category : 'accessing' }
CMSaveToCsvCommand >> owner [

	^ owner
]

{ #category : 'accessing' }
CMSaveToCsvCommand >> owner: anObject [

	owner := anObject
]

{ #category : 'exporting' }
CMSaveToCsvCommand >> saveDataToFile: fileReference [

	| writer data headers |
	"Retrieve data from the owner"
	data := owner data.

	"Check if data exists"
	data ifNil: [ ^ self ].
	data ifEmpty: [ ^ self ].

	fileReference ifNotNil: [
		fileReference writeStreamDo: [ :stream |
			writer := NeoCSVWriter on: stream.

			"Configure the writer to handle each field as a single entity"
			writer fieldWriter: #raw. "Use raw field writer to prevent splitting"
			writer separator: $,. "Set comma as separator"

			"Extract headers dynamically from the first row"
			headers := data first keys asArray.

			"Write headers"
			writer writeHeader: headers.

			"Write each row of data"
			data do: [ :row | "Create an array of values for this row"
				| rowValues |
				rowValues := headers collect: [ :header |
					             (row at: header ifAbsent: [ '' ]) asString ].

				"Write the entire row as a single entity"
				writer nextPut: rowValues ] ] ]
]
