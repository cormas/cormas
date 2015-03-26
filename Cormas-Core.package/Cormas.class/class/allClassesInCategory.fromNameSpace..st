util_files
allClassesInCategory: categoryName fromNameSpace: aNameSpace
	
	| collec |
	collec := OrderedCollection new.
	(aNameSpace classNames
		select: [:n | (aNameSpace at: n) category = categoryName])
		do: [:i | collec add: (aNameSpace at: i)].
	^collec