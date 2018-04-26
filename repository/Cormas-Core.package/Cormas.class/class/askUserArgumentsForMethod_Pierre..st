util_strings
askUserArgumentsForMethod_Pierre: aMethodAsString
	"open a Dialog to set the arguments values. Return a collection of values if many arguments or just the value entered otherwise"
	
	| arg aV nbArguments |
	arg := OrderedCollection new.
	nbArguments := (aMethodAsString select: [:ch | ch = $:]) size.
	nbArguments
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
			arg add: aV].
	nbArguments = 1 ifTrue: [^aV].
	^arg asArray