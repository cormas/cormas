decisions sheets
nullDecisionsSheet: playerName
	
	(self model playersBlocks at: playerName)
		do:
			[:aBlockName | 
			((self blocks at: aBlockName) at: #inputFields)
				do:
					[:aSpecName | 
					(self model decisionsSheets at: playerName)
						at: aSpecName
						put: (self nullValueForSpec: aSpecName)]]