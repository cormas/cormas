initialize-release
initForSuperClassOf: aKlass
	"Create a list of ClassAttributeValue of the superclasses of aKlass"
	
	| aList attributColl attributs allClasses |
	(aKlass inheritsFrom: CormasModelOld) ifTrue: [^nil].
	aList := List new.
	attributColl := OrderedCollection new.
	allClasses := aKlass superClassesUntilEntity.
	allClasses remove: aKlass.
	allClasses
		do:
			[:cl | 
			attributs := self class staticAttributsWithAccessorsFromClass: cl.
			#('bounds' 'povDict' 'activityDiagrams' 'colorsDict' 'activeProbes' 'image')
				do:
					[:att | 
					attributs
						remove: att
						ifAbsent: []].	"remove attributs of CormasModel"
			#('spatialClasses' 'povColorsDict' 'socialClasses' 'cellClass' 'visualStateIsOpen' 'savedWindowInformation' 'passiveClasses' 'timeStep' 'charts')
				do:
					[:att | 
					attributs
						remove: att
						ifAbsent: []].
			attributColl
				addAll:
					(self class
						getDefaultValuesForClass: cl class
						attributs: attributs).
			attributs := self class attributsWithAccessorsFromClass: cl.
			#('povs' 'outline' 'edge' 'orderedNeighbourhood' 'flag' 'collector' 'request' 'includedEntities')
				do:
					[:att | 
					attributs
						remove: att
						ifAbsent: []].
			attributs
				remove: 'povs'
				ifAbsent: [].
			attributColl
				addAll: (self class getDefaultValuesForClass: cl attributs: attributs)].
	attributColl
		do:
			[:coll | 
			aList
				add:
					(ClassAttributeValue
						newClass: coll first
						attribute: (coll at: 2)
						value: (coll at: 3))].
	self superClassAttribValue_List list: aList.
	super initialize