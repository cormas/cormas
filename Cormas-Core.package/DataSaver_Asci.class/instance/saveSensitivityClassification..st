+ save
saveSensitivityClassification: aDictionary
	"Save aDictionary into the current directory"
	
	| aCollection aFileName |
	aDictionary
		keysAndValuesDo:
			[:key :dico | 
			aCollection := OrderedCollection new.
			dico
				keysAndValuesDo:
					[:k :v | 
					aCollection
						add:
							(Array
								with: k asString
								with: v)].
			aFileName := 'globalSensitivityOf_' , key asString
				, self class extension.
			self
				updateFile: aFileName
				dataCollection:
					(Array
						with: 'Probe: ' , key asString
						with: 'sensitivity').
			aCollection
				do: [:coll | self updateFile: aFileName dataCollection: coll]]