Class {
	#name : 'CMClyNewAgentCommand',
	#superclass : 'CMClyPackageCommand',
	#category : 'Cormas-Core-Calypso',
	#package : 'Cormas-Core',
	#tag : 'Calypso'
}

{ #category : 'activation' }
CMClyNewAgentCommand class >> fullBrowserMenuActivation [
	<classAnnotation>
	
	^ CmdContextMenuActivation
		byItemOf: CMClyMenuGroup
		for: ClyFullBrowserPackageContext
]

{ #category : 'accessing' }
CMClyNewAgentCommand >> defaultMenuIconName [

	^ #smallNew
]

{ #category : 'accessing' }
CMClyNewAgentCommand >> defaultMenuItemName [

	^ 'New Cormas agent class'
]

{ #category : 'accessing' }
CMClyNewAgentCommand >> description [

	^ 'Create a new Cormas agent class'
]

{ #category : 'execution' }
CMClyNewAgentCommand >> execute [

	"Do nothing"
]
