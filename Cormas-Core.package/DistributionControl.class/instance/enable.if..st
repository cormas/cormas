utiles
enable: widgetIDs if: aBoolean
	"enable/disable one or many widgets. widgetsIDs can be aSymbol or an Array of Symbol"
	
	(Cormas arrayFrom: widgetIDs)
		do:
			[:each | (self wrapperAt: each) ifNotNil: [:w | w isEnabled: aBoolean]]