utiles
visible: widgetIDs if: aBoolean
	"set visible/invisible one or many widgets. widgetsIDs can be aSymbol or an Array of Symbol"
	
	(Cormas arrayFrom: widgetIDs)
		do:
			[:each | (self wrapperAt: each) ifNotNil: [:w | w isVisible: aBoolean]]