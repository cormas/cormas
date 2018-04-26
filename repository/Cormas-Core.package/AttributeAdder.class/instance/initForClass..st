initialize-release
initForClass: aKlass
	"Create a list of ClassAttributeValue"
	
	| aList attributColl attributs aCAV |
	self initForSuperClassOf: aKlass.
	aList := List new.
	attributColl := OrderedCollection new.
	attributs := self class staticAttributsWithAccessorsFromClass: aKlass.
	attributColl
		addAll:
			(self class
				getDefaultValuesForClass: aKlass class
				attributs: attributs).
	attributs := self class attributsWithAccessorsFromClass: aKlass.
	attributColl
		addAll:
			(self class getDefaultValuesForClass: aKlass attributs: attributs).
	attributColl
		do:
			[:coll | 
			aCAV := ClassAttributeValue
				newClass: coll first
				attribute: (coll at: 2)
				value: (coll at: 3).
			aCAV hasBeenModified: false.
			aList add: aCAV].
	self classAttribValue_List list: aList.
	targetClass := aKlass.
	super initialize