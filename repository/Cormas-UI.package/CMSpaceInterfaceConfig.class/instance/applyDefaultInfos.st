overwrite spaceInterface
applyDefaultInfos
	
	| cellClass CSCs occupantClassses dicoInfo |
	(self spaceInterface infoMethodDico select: [:v | v ~= #nil])
		keysDo:
			[:aClass | 
			self spaceInterface
				changeInfo: #nil
				ofEntity: aClass class].
	dicoInfo := self defaultInfo copy select: [:v | v isNil not].
	cellClass := self spaceInterface cormasModelClass cellClass.
	CSCs := self spaceInterface cormasModelClass compoundSpatialClasses.
	occupantClassses := self spaceInterface cormasModelClass occupantClasses.
	(self defaultInfoFor: cellClass) isNil not
		ifTrue:
			[self spaceInterface
				changeInfo: ((self defaultInfoFor: cellClass) ifNil: [#nil])
				ofEntity: cellClass.	"ifNotNil:[]"
			dicoInfo
				keysAndValuesDo:
					[:aClass :defInfo | 
					((CSCs includes: aClass) and: [defInfo = #delimitors])
						ifTrue: [self spaceInterface changeInfo: defInfo ofEntity: aClass]].
			dicoInfo
				keysAndValuesDo:
					[:aClass :defInfo | 
					(occupantClassses includes: aClass)
						ifTrue: [self spaceInterface changeInfo: defInfo ofEntity: aClass]]]
		ifFalse:
			[dicoInfo
				keysAndValuesDo:
					[:aClass :defInfo | 
					((CSCs includes: aClass) and: [defInfo isNil not])
						ifTrue: [self spaceInterface changeInfo: defInfo ofEntity: aClass]].
			dicoInfo
				keysAndValuesDo:
					[:aClass :defInfo | 
					(occupantClassses includes: aClass)
						ifTrue: [self spaceInterface changeInfo: defInfo ofEntity: aClass]]]