overwrite spaceInterface
applyDefaultPovs
	| dicoPov cellClass cSCs occupantClassses |
	(self spaceInterface povMethodDico select: [ :v | v ~= #nil ])
		keysDo:
			[ :aClass | self spaceInterface changePov: #nil ofEntity: aClass class ].
	dicoPov := self defaultPov copy reject: [ :v | v isNil ].
	cellClass := self spaceInterface cormasModelClass cellClass.
	cSCs := self spaceInterface cormasModelClass compoundSpatialClasses.
	occupantClassses := self spaceInterface cormasModelClass
		occupantClasses.
	(self defaultPovFor: cellClass) isNil not
		ifTrue: [ self spaceInterface
				changePov: ((self defaultPovFor: cellClass) ifNil: [ #nil ])
				ofEntity: cellClass.
			dicoPov
				keysAndValuesDo: [ :aClass :defPov | 
					((cSCs includes: aClass) and: [ defPov = #delimitors ])
						ifTrue: [ self spaceInterface changePov: defPov ofEntity: aClass ] ].
			dicoPov
				keysAndValuesDo: [ :aClass :defPov | 
					(occupantClassses includes: aClass)
						ifTrue: [ self spaceInterface changePov: defPov ofEntity: aClass ] ] ]
		ifFalse: [ dicoPov
				keysAndValuesDo: [ :aClass :defPov | 
					((cSCs includes: aClass)
						and: [ defPov isNil not and: [ defPov ~= #delimitors ] ])
						ifTrue: [ self spaceInterface changePov: defPov ofEntity: aClass ] ].
			dicoPov
				keysAndValuesDo: [ :aClass :defPov | 
					((cSCs includes: aClass) and: [ defPov = #delimitors ])
						ifTrue: [ self spaceInterface changePov: defPov ofEntity: aClass ] ].
			dicoPov
				keysAndValuesDo: [ :aClass :defPov | 
					(occupantClassses includes: aClass)
						ifTrue: [ self spaceInterface changePov: defPov ofEntity: aClass ] ] ]