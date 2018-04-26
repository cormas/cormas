save
setCAVfrom: fileContent
	
	| aCAV |
	self classAttribValue_List list
		do:
			[:cav | 
			cav distributionList: nil.
			cav hasBeenModified: false].
	fileContent
		do:
			[:line | 
			aCAV := self classAttribValue_List list
				detect:
					[:cav | 
					cav targetClass name asString = line first
						and: [cav targetAttribute asString = (line at: 2)]]
				ifNone: [nil].
			aCAV isNil
				ifFalse:
					[aCAV currentValueAsString: (line at: 3).
					aCAV distributionListAsString: (line at: 4)]]