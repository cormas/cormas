changed
changePov: selectorName ofEntity: aClass
	"Called from the user, when he changes aPoV"
	
	aClass withAllSubclasses
		do:
			[:cl | 
			"self changeInfo: #nil ofEntity: cl. on supprime les info sur les figures"
			"apparement c''est pas n√©cessaire"
			self povMethodDico
				at: cl name
				put: selectorName.	"on memorise les pov"
			self fillDico
				at: cl name
				put: selectorName ~= #nil.
			self legend isOpen
				ifTrue:
					[self legend
						majLegendes:
							(Array
								with: cl
								with: selectorName asString)]].	"on supprime les pov des autres classes spatiales"
	aClass isSpatialClass
		ifTrue:
			[| classes |
			classes := self spatialClasses copy.	"SpatialEntity allSubclasses"
			classes remove: aClass.
			classes
				do:
					[:cl | 
					(cl isElementary and: [selectorName = #delimitors])
						ifFalse:
							[(self povMethodDico at: cl name) = #delimitors
								ifFalse:
									[self povMethodDico
										at: cl name
										put: #nil].
							self fillDico
								at: cl name
								put: false]]].	"il faut regler aussi le petit onglet du menu"
	self checkPovMenu.	"*** finally, change the POV !"
	aClass withAllSubclasses
		do: [:cl | self drawing changePov: selectorName ofEntity: cl].	"change the window title"
	self updateWindowName	"Pas besoin d''un refreshViewDisplay car le updateWindowName force le r√©affichage"