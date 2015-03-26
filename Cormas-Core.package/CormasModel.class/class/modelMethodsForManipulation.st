- activityEditor
modelMethodsForManipulation
	"Return a set of all instance methods of this class and model upperclasses which are not in protocols #pov #accessing #probes #info.
Ex: CormasModel modelMethodsForManipulation"
	
	| coll categories |
	coll := IndexedSet new.
	(self superClassesUntil: CormasModel)
		do:
			[:aClass | 
			(self environment includes: aClass)
				ifTrue:
					[categories := (aClass organization categories
						select: [:cat | (cat first = $-) not]) asOrderedCollection.
					categories
						remove: #'default values'
						ifAbsent: [].
					coll
						addAll:
							(aClass selectors
								select:
									[:method | categories includes: (aClass organization categoryOfElement: method)])
								sorted]
				ifFalse:
					[categories := (aClass organization categories
						select: [:cat | cat first = $+]) asOrderedCollection.
					categories
						removeAllSuchThat:
							[:p | (p findString: 'utilities' startingAt: 1) ~= 0].
					#(#'+ pov' #'+ utilities - ODBC')
						do:
							[:cat | 
							categories
								remove: cat
								ifAbsent: []].
					coll
						addAll:
							(aClass selectors
								select:
									[:method | categories includes: (aClass organization categoryOfElement: method)])
								sorted]].
	coll removeAllSuchThat: [:s | s includes: $:].
	^coll