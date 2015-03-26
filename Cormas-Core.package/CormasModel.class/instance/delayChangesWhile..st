private - notification
delayChangesWhile: aBlock
	"delay changes (see registerChangeFor:) during aBlock evaluation.
	transmit all delayed changes immediately after"
	
	(delayedChanges == nil and: [self cormas isChangesDelayed])
		ifTrue:
			[[delayedChanges := OrderedCollection new.
			aBlock value]
				ensure:
					[| coll |
					coll := delayedChanges.
					delayedChanges := nil.
					self spaceModel noticeChanges: coll]]
		ifFalse: [aBlock value]