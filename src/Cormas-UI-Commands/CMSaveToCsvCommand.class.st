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
	data := owner data.

	data ifNil: [ ^ self ].
	data ifEmpty: [ ^ self ].

	fileReference ifNotNil: [
		fileReference writeStreamDo: [ :stream |
			writer := NeoCSVWriter on: stream.

			writer fieldWriter: #raw. 
			writer separator: $,. 

			
			headers := data first keys asArray.


			writer writeHeader: headers.

		
			data do: [ :row | 
				| rowValues |
				rowValues := headers collect: [ :header |
					             (row at: header ifAbsent: [ '' ]) asString ].

				
				writer nextPut: rowValues ] ] ]
]
