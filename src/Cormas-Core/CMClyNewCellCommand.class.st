Class {
	#name : 'CMClyNewCellCommand',
	#superclass : 'CMClyPackageCommand',
	#category : 'Cormas-Core-Helpers',
	#package : 'Cormas-Core',
	#tag : 'Helpers'
}

{ #category : 'activation' }
CMClyNewCellCommand class >> fullBrowserMenuActivation [
	<classAnnotation>
	
	^ CmdContextMenuActivation
		byItemOf: CMClyMenuGroup
		for: ClyFullBrowserPackageContext
]

{ #category : 'accessing' }
CMClyNewCellCommand >> defaultMenuIconName [

	^ #smallNew
]

{ #category : 'accessing' }
CMClyNewCellCommand >> defaultMenuItemName [

	^ 'New Cormas cell class'
]

{ #category : 'accessing' }
CMClyNewCellCommand >> description [

	^ 'Create a new Cormas cell class'
]

{ #category : 'execution' }
CMClyNewCellCommand >> execute [

	"Do nothing"
]
