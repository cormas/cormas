model entities
browser
	"return the associated browser redisplaying its windows or recreate one if necessary"
	
	^RefactoringBrowser
		ifDefinedDo:
			[:browserClass | 
			self browserWindow
				ifNil: [browser := browserClass open]
				ifNotNil:
					[:win | 
					win isCollapsed
						ifTrue: [win expand]
						ifFalse: [win raise]].
			browser]