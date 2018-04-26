actions
verifyAndInstall
	
	| aName |
	self verify ifFalse: [^false].	"check if targetClass is defined"
	self targetClass
		ifNil:
			[| answer |
			answer := Dialog
				choose: 'On which class to install the diagram?'
				fromList: (CMEntity allTerminalClasses collect: [:cl | cl name asString])
				values: CMEntity allTerminalClasses
				lines: 8
				cancel: [nil].
			answer isNil
				ifTrue: [^nil]
				ifFalse: [self targetClass: answer]].
	aName := Dialog
		request: 'Name of the operation?'
		initialAnswer: self name.
	aName isEmpty ifTrue: [^self].
	aName := aName asSymbol.	"check if aName is a standart instance method already defined"
	(self targetClass allInstanceSelectors includes: aName)
		ifTrue:
			[(self cormas
				confirm:
					'The <' , aName printString , '> method already exist into '
						, self targetClass name asString
						, ' or its super classes. \Redifine it?' withCRs)
				ifFalse: [^self verifyAndInstall]].
	self name: aName.	"store this instance of activityDiagram into activityDiagrams class variable dictionary"
	self targetClass activityDiagrams
		at: self name
		put: self.	"store this instance of activityDiagram as 2 new methods (#aName and #activity_aName)"
	self
		compileForClass: self targetClass
		selector: self name.
	self setTitle