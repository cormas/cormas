menu-symbol
menuDefaultColor
	"return a Menu : #menuSymbolePDV menu"
	
	^((self builder menuAt: #menuSymbolePDV) value atNameKey:
			#submenuSetDefaultColor) submenu