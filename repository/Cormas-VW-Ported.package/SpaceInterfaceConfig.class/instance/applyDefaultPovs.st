overwrite spaceInterface
applyDefaultPovs
	
	| dicoPov cellClass CSCs occupantClassses |
	(self spaceInterface povMethodDico select: [:v | v ~= #nil])
		keysDo:
			[:aClass | 
			self spaceInterface
				changePov: #nil
				ofEntity: aClass class].
	dicoPov := self defaultPov copy select: [:v | v isNil not].
	cellClass := self spaceInterface cormasModelClass cellClass.
	CSCs := self spaceInterface cormasModelClass compoundSpatialClasses.
	occupantClassses := self spaceInterface cormasModelClass occupantClasses.
	(self defaultPovFor: cellClass) isNil not
		ifTrue:
			[self spaceInterface
				changePov: ((self defaultPovFor: cellClass) ifNil: [#nil])
				ofEntity: cellClass.
			dicoPov
				keysAndValuesDo:
					[:aClass :defPov | 
					((CSCs includes: aClass) and: [defPov = #delimitors])
						ifTrue: [self spaceInterface changePov: defPov ofEntity: aClass]].
			dicoPov
				keysAndValuesDo:
					[:aClass :defPov | 
					(occupantClassses includes: aClass)
						ifTrue: [self spaceInterface changePov: defPov ofEntity: aClass]]]
		ifFalse:
			[dicoPov
				keysAndValuesDo:
					[:aClass :defPov | 
					((CSCs includes: aClass)
						and: [defPov isNil not and: [defPov ~= #delimitors]])
						ifTrue: [self spaceInterface changePov: defPov ofEntity: aClass]].
			dicoPov
				keysAndValuesDo:
					[:aClass :defPov | 
					((CSCs includes: aClass) and: [defPov = #delimitors])
						ifTrue: [self spaceInterface changePov: defPov ofEntity: aClass]].
			dicoPov
				keysAndValuesDo:
					[:aClass :defPov | 
					(occupantClassses includes: aClass)
						ifTrue: [self spaceInterface changePov: defPov ofEntity: aClass]]]