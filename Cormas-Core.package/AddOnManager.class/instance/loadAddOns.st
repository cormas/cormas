actions
loadAddOns
	
	(self addOns_List list select: [:i | i shouldLoad])
		do:
			[:i | 
			i typeAsString = 'ST' ifTrue: [i file fileIn].
			i typeAsString = 'Parcel' ifTrue: [Parcel loadParcelFrom: i file]]