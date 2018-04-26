util_strings
askUserArgumentsForMethod: aMethodAsString classesAsArgForModel: aCormasModel
	
	| arg aV |
	arg := OrderedCollection new.
	(aMethodAsString select: [:ch | ch = $:]) size
		timesRepeat:
			[aV := self current
				request:
					(arg isEmpty
						ifTrue:
							['Enter an argument for this method
if the value is a symbol, start with #']
						ifFalse: ['Enter the next argument']).
			aV = '' ifTrue: [^nil].
			aV := Cormas stringAsObjectType: aV.
			((aCormasModel allEntityClasses collect: [:c | c name]) includes: aV asSymbol)
				ifTrue:
					[(self current confirm: 'Do you mean the Class ' , aV , ' ?')
						ifTrue: [aV := aV asSymbol class]].
			arg add: aV].
	^arg asArray