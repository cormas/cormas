initialize-release
setNewValues
	
	| factor |
	factor := self percent value / 100 asFloat.
	self plusMinus value = #minus ifTrue: [factor := -1 * factor].
	self classAttribValue_List list
		do:
			[:cav | 
			| v |
			v := cav currentValue * (1 + factor).
			(cav valueType includesBehavior: Integer)
				ifTrue: [v := v rounded asInteger].
			cav finalValue: v.
			cav initValue: v.
			cav finalValue: v.
			cav step: 1.
			cav hasBeenModified: true].	"refresh"
	self classAttribValue_List list: self classAttribValue_List list