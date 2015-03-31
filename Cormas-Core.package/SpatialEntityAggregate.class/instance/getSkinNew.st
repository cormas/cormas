- deprecated
getSkinNew
	"clp feb 2001"
	"renvoie les cellules en lisiere interne"
	
	^self components
		select:
			[:c | c neighbourhood contains: [:n | (self components includes: n) not]]