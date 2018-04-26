procedures
histogramOf: indiData withClasses: classesSet
	
	| dataSet temp classIndex int nbDigits |
	dataSet := OrderedCollection new.
	int := (classesSet last - classesSet first) / classesSet size.
	int >= 1
		ifTrue: [nbDigits := 0]
		ifFalse:
			[int >= 0.1
				ifTrue: [nbDigits := 1]
				ifFalse: [nbDigits := 2]].
	classIndex := 1.
	classesSet
		do:
			[:v | 
			temp := indiData select: [:i | i < v].
			classIndex = 1
				ifFalse:
					[dataSet
						add:
							(Array
								with: temp size
								with:
									'['
										,
											((Cormas
												round: (classesSet at: classIndex - 1)
												toNdigits: nbDigits) printString , ';'
												, (Cormas round: v toNdigits: nbDigits) printString , '['))].
			indiData removeAll: temp.
			classIndex := classIndex + 1].
	classesSet size = 1
		ifFalse:
			[dataSet
				add:
					(Array
						with: indiData size
						with: '>=' , classesSet last printString)]
		ifTrue:
			[dataSet
				add:
					(Array
						with: indiData size
						with: '=' , classesSet last printString)].
	^dataSet