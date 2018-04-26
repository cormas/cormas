menu-symbol
setSymbolAsDefaultImage
	"selectedClass povDict at: listSymbols selection asSymbol"
	
	(self cormas confirm:
			'The selected image will be the shape for the next symbols of the class')
		ifFalse: [^nil].
	listSymbols selection isNil
		ifTrue: [^self cormas warn: 'Please, select a symbol'].
	((selectedClass povDict at: listSymbols selection asSymbol) isKindOf:
			BitmapPOV)
		ifTrue: [^self cormas warn: 'Cannot define a shape from a bitmap'].
	selectedClass class
		compile:
			('defaultImage' ,
					'\"returns a copy of the POV image stored in the povDict of the class at a specifed symbol key"\^((self povDict at: #'
				, listSymbols selection , ' ifAbsent:[super defaultImage]) copy')
				withCRs
		classified: 'pov symbols'
		notifying: nil