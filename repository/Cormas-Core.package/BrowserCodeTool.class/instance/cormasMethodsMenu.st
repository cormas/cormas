menu
cormasMethodsMenu
	
	<computedSubmenu: 'Insert method' nameKey: #cormasMethodsMenu menu:
			#(#mainMenu) position: 1.1>
	| mb |
	mb := MenuBuilder new.
	(codeModel navigator isNil not
		and: [self isActive and: [self selectedClass inheritsFrom: CMEntity]])
		ifTrue:
			[mb := self addEntityMethodsToMenuBuilder: mb.
			mb := self addEntityClassMethodsToMenuBuilder: mb].
	(codeModel navigator isNil not
		and: [self isActive and: [self selectedClass inheritsFrom: CormasModelOld]])
		ifTrue:
			[mb := self addModelMethodsToMenuBuilder: mb.
			mb := self addModelClassMethodsToMenuBuilder: mb].
	mb := self addCormasUtilsToMenuBuilder: mb.
	^mb menu