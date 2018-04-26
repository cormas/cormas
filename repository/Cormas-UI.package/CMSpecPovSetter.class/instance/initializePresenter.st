initialization
initializePresenter
	" Private - See superimplementor's comment "

"	self povColorButton
		action: [ self openColorChooser ]"
	self listSymbols when: #changed send: #listSymbolsChanged to: self.
	self listMethods when: #changed send: #listMethodsChanged to: self.	