actions
removeHiddenAttributes
	"Removes elements of classAttribValue_List that are into cormasModel hiddenAttributes list"
	
	| cavList currentCAV |
	cavList := List new.
	self cormasModel hiddenAttributes
		do:
			[:cav | 
			currentCAV := self classAttribValue_List list
				detect:
					[:each | 
					each targetClass = cav targetClass
						and: [each targetAttribute = cav targetAttribute]]
				ifNone: [nil].
			currentCAV isNil ifFalse: [cavList add: currentCAV]].
	cavList do: [:cav | cav isHidden: true].
	self classAttribValue_List list removeAll: cavList