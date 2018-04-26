blocks
majBlock: aBlockName
	
	((self blocks at: aBlockName) at: #inputFields)
		do:
			[:aSpecName | 
			(self model decisionsSheets at: self selectedPlayer)
				at: aSpecName
				put: (self perform: aSpecName) value]