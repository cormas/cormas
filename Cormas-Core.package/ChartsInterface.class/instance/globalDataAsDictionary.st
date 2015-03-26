accessing
globalDataAsDictionary
	"return a dictionary of the data: probe name as key and values"
	
	| noms valeurs coll dico |
	dico := Dictionary new.
	noms := chartsList selections.
	valeurs := data value.
	1
		to: noms size
		do:
			[:i | 
			coll := OrderedCollection new.
			valeurs do: [:aList | coll add: (aList at: i)].
			dico
				at: (noms at: i)
				put: coll].
	^dico