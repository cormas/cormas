- accessing - methods & classes
allMethodsButProtocols: aProtocolList
	"Return a set of all instance methods of this class and upperclasses which are not in the given aProtocolList.
	aProtocolList = <Collection of string>, ex: #('* pov' '+ pov' '+ accessing' 'probes' '* info')"
	
	| coll |
	coll := OrderedCollection new.
	self superClassesUntilEntity
		do: [ : aClass | 
			(self cmEnvironment includes: aClass)
				ifTrue: [
					| cat |
					cat := aClass organization categories asOrderedCollection.
					cat removeAllSuchThat: [:st | aProtocolList includes: st asString].
					cat do: [ : categ | coll addAll: (aClass organization listAtCategoryNamed: categ) ] ] ].
	^ coll sorted