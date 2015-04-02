model entities
createProtocol: aSymbol forClass: aClass
	
	BrowserNavigator new
		performChange: (AddProtocolChange class: aClass protocol: aSymbol)