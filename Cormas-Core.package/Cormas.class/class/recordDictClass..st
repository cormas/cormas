- printing - documentation
recordDictClass: aClass
	
	| dict dictClass |
	dict := Dictionary new.
	aClass organization categories asSortedCollection
		do:
			[:cat | 
			(self recordProtocol: cat class: aClass)
				keysAndValuesDo: [:k :v | dict at: k put: v]].
	dictClass := Dictionary new.
	aClass class organization categories asSortedCollection
		do:
			[:cat | 
			(self
				recordProtocol: cat
				class: aClass class) keysAndValuesDo: [:k :v | dictClass at: k put: v]].
	^Array with: dict with: dictClass