Class {
	#name : 'CMModelOpenerExportCommand',
	#superclass : 'CMModelOpenerCommand',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'action' }
CMModelOpenerExportCommand >> action [

	^ self inform: 'Model exporting is not implemented yet'
]

{ #category : 'accessing' }
CMModelOpenerExportCommand >> icon [

	^ self iconNamed: #save
]

{ #category : 'accessing' }
CMModelOpenerExportCommand >> name [

	^ 'Export'
]
