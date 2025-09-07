Class {
	#name : 'CMSaveToCsvCommand',
	#superclass : 'CMDataPresenterCommand',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'action' }
CMSaveToCsvCommand >> action [

	| message |

	(StSaveFilePresenter extensions: {'csv'})
		okAction: [ :fileReference | 
			self saveDataToFile: fileReference.
			
			message := String streamContents: [ :stream |
				stream
					<< 'Data saved to '
					<< fileReference asString;
					cr; cr;
					<< 'Click to open location' ].
			
			UIManager default
				inform: message
			 	actionOnClick: [ fileReference openInOSFileBrowser ]]
]

{ #category : 'accessing' }
CMSaveToCsvCommand >> icon [

	^ CMIcons csvIcon
]

{ #category : 'accessing' }
CMSaveToCsvCommand >> name [

	^ translator tSaveToCsv
]

{ #category : 'export' }
CMSaveToCsvCommand >> saveDataToFile: aFileReference [ 

	| data columnNames |
	data := owner data.

	data ifNil: [ ^ self ].
	data ifEmpty: [ ^ self ].
	aFileReference ifNil: [ ^ self ].
	
	aFileReference writeStreamDo: [ :stream |
		columnNames := data first keys.
		stream nextPutAll: (',' join: columnNames); cr.
		
		data do: [ :row |
			stream nextPutAll: (',' join: row); cr ] ].


]
