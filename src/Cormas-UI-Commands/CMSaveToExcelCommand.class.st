Class {
	#name : 'CMSaveToExcelCommand',
	#superclass : 'CMDataPresenterCommand',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'accessing' }
CMSaveToExcelCommand >> action [

	"do Nothing"
]

{ #category : 'accessing' }
CMSaveToExcelCommand >> icon [

	^ CMIcons excelIcon
]

{ #category : 'accessing' }
CMSaveToExcelCommand >> name [

	^ translator tSaveToExcel
]
