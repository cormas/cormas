accessing
menuHolder
	
	menuHolder ifNil: [menuHolder := self class mainMenu asValue].
	^menuHolder