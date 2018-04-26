+ save
saveSensitivityClassification: aDictionary
	"Save aDictionary into the current directory"
	
	| aCollection aFileName excelFile |
	filename := self directory
		construct: 'globalSensitivity' , self class extension.
	aFileName := 'globalSensitivity' , self class extension.
	excelFile := self initExcelFile: aFileName.
	excelFile createSheetsFromProbes: self probes keys asSortedCollection.
	excelFile dataSavedByLine: true.
	aDictionary
		keysAndValuesDo:
			[:key :dico | 
			aCollection := OrderedCollection new.
			dico
				keysAndValuesDo:
					[:k :v | 
					aCollection
						add:
							(List
								with: k asString
								with: v)].
			self
				saveCollectionWithLabel:
					(List
						with: 'Probe: ' , key asString
						with: 'sensitivity')
				onSheet: key asString
				onFile: aFileName.
			aCollection
				do:
					[:coll | 
					self
						saveCollectionWithLabel: coll
						onSheet: key asString
						onFile: aFileName]]