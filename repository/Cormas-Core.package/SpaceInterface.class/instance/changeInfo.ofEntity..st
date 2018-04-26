changed
changeInfo: aSymbol ofEntity: aClass
	"Called from the user, when an Info has to be displayed"
	
	aClass withAllSubclasses
		do:
			[:cl | 
			"on memorise les #infos"
			self infoMethodDico
				at: cl name
				put: aSymbol.
			self drawing changeInfo: aSymbol ofEntity: cl].	"il faut regler aussi le petit onglet du menu"
	self checkInfoMenu.	"change the window title"
	self updateWindowName