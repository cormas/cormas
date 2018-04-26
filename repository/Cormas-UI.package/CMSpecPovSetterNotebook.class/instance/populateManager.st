initialization
populateManager
	" Add dynamic tabs "

	self prepareClasses do: [ : entity |
		| tab |
		tab := (self newTabFor: entity)
				closeable: false;
				yourself.
		self tabManager addTab: tab ]