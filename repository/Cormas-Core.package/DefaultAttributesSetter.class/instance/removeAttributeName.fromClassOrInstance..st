actions
removeAttributeName: attributSymbol fromClassOrInstance: aClassOrInstance
	"returns a list of ClassAttributeValues of Entities that can be easily modified by user interface.
It means that the attributes must have both accessors available (setter & getter), and that they are Number, Boolean, String, Symbol or Class"
	
	self classAttribValue_List listHolder value
		removeAllSuchThat:
			[:aClassAttributValue | 
			aClassAttributValue targetClass = aClassOrInstance class
				and: [aClassAttributValue targetAttribute = attributSymbol]].
	^self classAttribValue_List