initialize-release
initForEntity: aE attribute: att
	
	| win |
	self isHistoOnEntityAttribute: true.
	self menuHolder: self class menuForOneAttribute asValue.
	self activeEntity: aE.
	self activeAttribute: att.
	win := (self allButOpenInterface: #windowForOneAttribute) window.
	self setNewHistoData.
	win
		openWithExtent:
			(win minimumSize x + (((self nbClasses min: 12) - 1.8) * 50))
				@ win minimumSize y.
	self refreshEachStepOption	"activate one time the option, so that it is true by default"