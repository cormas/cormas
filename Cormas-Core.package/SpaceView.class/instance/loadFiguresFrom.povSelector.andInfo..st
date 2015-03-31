adding-removing
loadFiguresFrom: aClass povSelector: selectorName andInfo: aInfoName
	"Create, add and return a collection of Figures from the Entity (aClass) and subclasses using a specified povSelector and infoName"
	
	| loadedFigures |
	loadedFigures := aClass isSpatialClass
		ifTrue:
			[self
				addFiguresForSpatialPovs:
					(self model povsOfSpatialEntity: aClass forSelector: selectorName andInfo:
							aInfoName)]
		ifFalse:
			[aClass isArcClass
				ifFalse:
					[self
						addFiguresForOccupantPovsAndPatches:
							(self model povsAndPatchesOfOccupantEntity: aClass forSelector:
									selectorName andInfo: aInfoName)]
				ifTrue:
					[self
						addFiguresForArcPovsAndPatches:
							(self model povsAndPatchesOfArcEntity: aClass forSelector: selectorName
								andInfo: aInfoName)]].
	aClass isSpatialEntitySetClass
		ifTrue:
			[loadedFigures do: [:f | self sendToBack: f].
			self celluleFigures do: [:cf | self sendToBack: cf]].
	aClass isSpatialEntityElementClass
		ifTrue: [loadedFigures do: [:cf | self sendToBack: cf]].
	^loadedFigures