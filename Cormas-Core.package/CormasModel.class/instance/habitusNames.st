- user interface
habitusNames
	
	| collec |
	collec := SortedCollection new.
	(self class class organization listAtCategoryNamed: #SI_config)
		do:
			[:e | 
			collec
				add:
					(e
						copyFrom: 10
						to: e size)].
	^collec