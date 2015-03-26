blocks
resetBlock: aBlockName
	
	(self model decisionsSheets at: self selectedPlayer) isEmpty
		ifFalse:
			[((self blocks at: aBlockName) at: #inputFields)
				do:
					[:aSpecName | 
					(self perform: aSpecName)
						value:
							((self model decisionsSheets at: self selectedPlayer) at: aSpecName)]]