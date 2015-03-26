getParameters
purgeClassAttribValue: aList
	"Removes elements of aList (ClassAttributeValues of Entities) that are not Number, Boolean, String, Symbol or Class"
	
	aList
		removeAllSuchThat:
			[:defaultAttrib | 
			defaultAttrib currentValue respondsToArithmetic not
				and:
					[(defaultAttrib currentValue class inheritsFrom: Boolean) not
						and:
							[(defaultAttrib currentValue class inheritsFrom: String) not
								and:
									[defaultAttrib currentValue isBehavior not
										and: [(defaultAttrib currentValue class inheritsFrom: Array) not]]]]]