procedures
histogramOf: indiData withTextClasses: classesSet
	
	| dataSet |
	dataSet := OrderedCollection new.
	classesSet
		do:
			[:v | 
			dataSet
				add:
					(Array
						with: (indiData select: [:i | i = v]) size
						with: v)].
	^dataSet