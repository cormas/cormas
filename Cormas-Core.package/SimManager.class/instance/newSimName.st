init
newSimName
	"Return a new simName defined from the current clock time. 
	Ex:    self basicNew newSimName  =>   sim_2014.04.22-14.09.43"
	
	| d |
	d := Timestamp now.
	^self simNameStart , d year printString , '.'
		,
			(d month < 10
				ifTrue: ['0' , d month printString]
				ifFalse: [d month printString]) , '.'
		,
			(d day < 10
				ifTrue: ['0' , d day printString]
				ifFalse: [d day printString]) , '-'
		,
			(d hour < 10
				ifTrue: ['0' , d hour printString]
				ifFalse: [d hour printString]) , '.'
		,
			(d minute < 10
				ifTrue: ['0' , d minute printString]
				ifFalse: [d minute printString]) , '.'
		,
			(d second < 10
				ifTrue: ['0' , d second printString]
				ifFalse: [d second printString])