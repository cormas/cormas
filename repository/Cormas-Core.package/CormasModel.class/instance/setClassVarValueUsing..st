- binary storage
setClassVarValueUsing: dictionary
	"Set the classVar values to the classes' attributes using dictionary (stored into BOSS file)"
	
	| attributes |
	dictionary
		keysAndValuesDo:
			[:aClass :coll | 
			attributes := aClass class allInstVarNames.
			coll
				do:
					[:asso | 
					aClass
						instVarAt: (attributes indexOf: asso key asString)
						put: asso value]]