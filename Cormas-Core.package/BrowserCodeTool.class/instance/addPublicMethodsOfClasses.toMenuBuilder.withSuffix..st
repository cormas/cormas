menu
addPublicMethodsOfClasses: aSetOfClasses toMenuBuilder: mb withSuffix: aString
	
	| dicoM protocolExactName |
	dicoM := Dictionary new.
	aSetOfClasses
		do:
			[:aClass | 
			aClass organization categories
				do:
					[:protocolName | 
					((protocolName asString findString: '+ ' startingAt: 1) = 1
						or: [(protocolName asString findString: '* ' startingAt: 1) = 1])
						ifTrue:
							[protocolExactName := protocolName
								copyFrom: 3
								to: protocolName size.
							(dicoM includesKey: protocolExactName)
								ifFalse:
									[dicoM
										at: protocolExactName
										put: Set new].
							(aClass organization listAtCategoryNamed: protocolName)
								do:
									[:aSelector | 
									(dicoM at: protocolExactName)
										add: (Cormas headerOfMethod: aSelector class: aClass)]]]].
	dicoM keys asSortedCollection
		do:
			[:aProtocol | 
			mb beginSubMenuLabeled: aProtocol.
			(dicoM at: aProtocol) asSortedCollection
				do:
					[:aM | 
					mb
						add:
							aM
								->
									[self textController
										insertAndSelect: aString , ' ' , aM asString
										at: self textController selectionStopIndex]].
			mb endSubMenu].
	^mb