visualized classes
figuresOfEntity: aClass
	
	^self components select: [:fig | fig entityType = aClass]