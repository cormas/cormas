accessing
totalSimNumberWithRepeat
	"return the number of simulations for the analysis, multiplying by the repeat number for each parameters set."
	
	| tot |
	tot := self totalSimNumber.
	tot = 0 ifTrue: [^self nbOfRepeat value].
	^tot * (self nbOfRepeat value max: 1)