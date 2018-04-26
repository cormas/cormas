as yet unclassified
runAndVisualize
	| menuBuilder |
	self openWithToolbar.
	menuBuilder := RTMenuBuilder new view: self.
	menuBuilder menu: 'nextStep'
	 background: (Color lightBlue alpha: 0.4) 
	callback: [ self runModelStep ].
	