interface actions
entities
	"Open the ENTITIES interface"
	
	| selectionInList |
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].
	self defineEntityWin isNil
		ifTrue:
			["bdr := self allButOpenInterface: #entities. Pour ouvrir la fenetre juste sous Cormas. Mais, qd on la ferme, √ßa ferme le mod√®le...
	self defineEntityWin:  bdr window.
	bdr source mainWin: self defineEntityWin.
	self defineEntityWin openIn: (10 @ 20 extent: self defineEntityWin minimumSize)."
			#('Spatial' 'Social' 'Passive')
				do:
					[:aType | 
					selectionInList := self perform: ('list' , aType , 'Entities') asSymbol.
					(self perform: ('list' , aType , 'Entities') asSymbol)
						list: (self getSortedListEntityClassType: aType)].
			self
				defineEntityWin: (self class openOn: self withSpec: #entities) window]
		ifFalse:
			[(self defineEntityWin)
				raise;
				expand].
	self listEntitesSpatialesChanged