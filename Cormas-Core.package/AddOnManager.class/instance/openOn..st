instance creation
openOn: aCormas
	
	| win |
	cormas := aCormas.
	self prepareTable ifNil: [^self class isWinOpen: false].
	win := (self allButOpenInterface: #windowSpec) window.
	win open.
	self class isWinOpen: true