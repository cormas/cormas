Extension { #name : 'CMBlElement' }

{ #category : '*Cormas-Bloc-Spec' }
CMBlElement >> asPresenter [
	"Answer a new presenter showing me, which can be opened or embedded in another presenter"

	^ self presenterShowing: self
]

{ #category : '*Cormas-Bloc-Spec' }
CMBlElement >> contextMenuCommandsFor: anEntity [

	| commands |
	commands := OrderedCollection
		            with:
		            (CMInspectSpaceContextMenuCommand forOwner: anEntity)
		            with:
		            (CMBrowseSpaceContextMenuCommand forOwner: anEntity).
	anEntity isSpatialEntity ifFalse: [
		commands add: (CMKillSpaceContextMenuCommand forOwner: anEntity) ].
	^ commands sorted: [ :a :b | a class order < b class order ]
]

{ #category : '*Cormas-Bloc-Spec' }
CMBlElement >> contextMenuFor: anEntity [
	"Answer a menu with the commands and the actions of anEntity. Each of them updates me after it runs"

	| menu |
	menu := SpMenuPresenter new
		        title: anEntity class name;
		        yourself.
	(self contextMenuCommandsFor: anEntity) do: [ :command |
			menu addItem: [ :item |
					item
						name: command name;
						icon: command icon;
						action: [
								command action.
								self update ] ] ].
	menu addGroup: [ :group |
			anEntity actionSelectors do: [ :selector |
					group addItem: [ :item |
							item
								name: selector asString;
								icon: (self iconNamed: #jump);
								action: [
										anEntity perform: selector.
										self update ] ] ] ].
	^ menu
]

{ #category : '*Cormas-Bloc-Spec' }
CMBlElement >> presenterShowing: anElement [

	| presenter |
	self whenRightClickOnEntityDo: [ :entity |
			(self contextMenuFor: entity) openWithSpecAt:
				self currentHand position ].
	presenter := SpBlSpaceInMorphPresenter new.
	presenter space defer: [ presenter space root addChild: anElement ].
	^ presenter
]
