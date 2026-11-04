Extension { #name : 'CMBlElement' }

{ #category : '*Cormas-Bloc-Spec' }
CMBlElement >> addAggregatesOf: aSpatialEntity to: aMenu [

	aSpatialEntity allAggregates ifEmpty: [ ^ self ].
	aMenu addGroup: [ :group |
			(aSpatialEntity allAggregates sorted: [ :a :b | a id > b id ]) do: [
					:each |
					group addItem: [ :item |
							item
								name: each class name , ' ' , each id printString;
								subMenu: (self contextMenuFor: each) ] ] ]
]

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
	anEntity isLink
		ifTrue: [
		commands add: (CMRemoveSpaceContextMenuCommand forOwner: anEntity) ]
		ifFalse: [
				anEntity isSpatialEntity ifFalse: [
					commands add: (CMKillSpaceContextMenuCommand forOwner: anEntity) ] ].
	^ commands sorted: [ :a :b | a class order < b class order ]
]

{ #category : '*Cormas-Bloc-Spec' }
CMBlElement >> contextMenuFor: anEntity [
	"Answer a menu with the commands and the actions of anEntity, and a submenu for each aggregate containing it. Each of them updates me after it runs"

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
	anEntity isSpatialEntity ifTrue: [
		self addAggregatesOf: anEntity to: menu ].
	^ menu
]

{ #category : '*Cormas-Bloc-Spec' }
CMBlElement >> layOutRootOf: aSpace attempts: aNumber [
	"Bloc does not announce the first real size of its morph, so the root would keep the default size of a space until the window is resized. The morph gets its size some frames after the presenter is displayed, so wait for it, but not forever"

	aSpace defer: [
			aSpace extent = aSpace host containerMorph extent
				ifTrue: [ aSpace root requestLayout ]
				ifFalse: [
					aNumber > 0 ifTrue: [
						self layOutRootOf: aSpace attempts: aNumber - 1 ] ] ]
]

{ #category : '*Cormas-Bloc-Spec' }
CMBlElement >> presenterShowing: anElement [

	| presenter |
	self whenRightClickOnEntityDo: [ :entity |
			(self contextMenuFor: entity) openWithSpecAt:
				self currentHand position ].
	presenter := SpBlSpaceInMorphPresenter new.
	presenter space defer: [
			presenter space root
				background: Smalltalk ui theme backgroundColor;
				addChild: anElement ].
	SystemAnnouncer uniqueInstance weak
		when: UIThemeChanged
		send: #useBackgroundOfTheTheme
		to: self.
	presenter whenDisplayDo: [
		self layOutRootOf: presenter space attempts: 100 ].
	^ presenter
]

{ #category : '*Cormas-Bloc-Spec' }
CMBlElement >> useBackgroundOfTheTheme [

	self spaceDo: [ :space |
			space defer: [
				space root background: Smalltalk ui theme backgroundColor ] ]
]
