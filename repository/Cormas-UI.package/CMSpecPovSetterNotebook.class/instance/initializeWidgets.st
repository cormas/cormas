initialization
initializeWidgets
	" Private - See superimplementor's comment "

	tabManager := self newTabManager.
	tabManager owner: self.
	self prepareClasses.