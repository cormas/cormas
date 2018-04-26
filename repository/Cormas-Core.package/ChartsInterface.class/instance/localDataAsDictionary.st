accessing
localDataAsDictionary
	"return a dictionary of the data: probe name as key and a sub dictionary where the key is the ID of the entity and coll is a collection of values"
	
	| dico noms lesIDs valeurs coll nomsEtIDs subdico timeValues colls |
	dico := Dictionary new.
	noms := chartsList selections.
	lesIDs := idList selections.
	valeurs := data value.
	nomsEtIDs := OrderedCollection new.
	lesIDs
		do: [:id | noms do: [:aNom | nomsEtIDs add: (Array with: aNom with: id)]].
	valeurs := data value.
	timeValues := OrderedCollection new.
	1
		to: nomsEtIDs size
		do:
			[:i | 
			coll := OrderedCollection new.
			coll add: (nomsEtIDs at: i) first.
			coll add: (nomsEtIDs at: i) last.
			valeurs do: [:aList | coll add: (aList at: i)].
			timeValues add: coll].
	noms
		do:
			[:aNom | 
			subdico := Dictionary new.
			dico at: aNom put: subdico.
			colls := timeValues select: [:col | col first = aNom].
			colls
				do:
					[:aColl | 
					| ident |
					ident := aColl at: 2.
					aColl removeFirst.
					aColl removeFirst.
					subdico at: ident put: aColl]].
	^dico