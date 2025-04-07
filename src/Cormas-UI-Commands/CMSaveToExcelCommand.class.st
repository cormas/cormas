Class {
	#name : 'CMSaveToExcelCommand',
	#superclass : 'CMDataPresenterCommand',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'action' }
CMSaveToExcelCommand >> action [

	"do nothing"
]

{ #category : 'accessing' }
CMSaveToExcelCommand >> icon [

	^ CMIcons excelIcon
]

{ #category : 'accessing' }
CMSaveToExcelCommand >> name [

	^ translator tSaveToExcel
]
