obsolete
loadDefaultAddOns
	
	| collec aFile |
	collec := self readDefaultAddOnsToLoad.
	self halt.
	collec
		do:
			[:aString | 
			aFile := Cormas addOnsPath asFilename construct: aString.
			aFile exists
				ifTrue:
					[aFile extension = '.st' ifTrue: [aFile fileIn].
					aFile extension = '.pcl' ifTrue: [Parcel loadParcelFrom: aFile]]]