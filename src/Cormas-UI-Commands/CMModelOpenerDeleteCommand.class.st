Class {
	#name : 'CMModelOpenerDeleteCommand',
	#superclass : 'CMModelOpenerCommand',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'action' }
CMModelOpenerDeleteCommand >> action [
	"If there is an Iceberg repository, use it to unload the project and then delete the repository itself. If repository cannot be found, then identify project packages and delete them one by one"
	owner cormasModelClass
		iceRepositoryIfFound: [ :repo | self deleteRepository: repo ]
		ifNotFound: [ self deletePackages ]
]

{ #category : 'cleaning' }
CMModelOpenerDeleteCommand >> deletePackages [

	| packages presenter |
	packages := owner cormasModelClass projectPackages.
	
	presenter := SpSelectMultipleDialog new
		title: 'Delete model';
		label: 'The following packages will be deleted';
		display: [ :each | each name ];
		displayIcon: [ self iconNamed: #package ];
		acceptLabel: 'Delete';
		items: packages;
		onAccept: [ :dialog |
			dialog presenter selectedItems do: [ :package |
				package removeFromSystem.
				owner signalUpdate ] ];
		yourself.
	
	presenter selectedItems addAll: packages.
	presenter openDialog
]

{ #category : 'as yet unclassified' }
CMModelOpenerDeleteCommand >> deleteRepository: anIceRepository [

	anIceRepository unload.
	anIceRepository delete.
	owner signalUpdate
]

{ #category : 'accessing' }
CMModelOpenerDeleteCommand >> icon [

	^ self iconNamed: #smallDelete
]

{ #category : 'accessing' }
CMModelOpenerDeleteCommand >> name [

	^ 'Delete'
]
