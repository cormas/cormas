default add-ons
saveAddOnsSettings
	
	| aFile collec |
	aFile := CormasOld addOnsPath asFilename construct:
			'Cormas_DefaultAddOnsToLoad.txt'.
	aFile exists ifTrue: [aFile delete].
	collec := (self addOns_List list select: [:i | i shouldLoad])
		collect: [:i | i fileAsString].
	collec isEmpty
		ifFalse: [CormasOld saveElementsOfCollec: collec inFile: aFile]