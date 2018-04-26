controlling
nbOfSims
	"return the number of simulations for the analysis of this attribute, WITHOUT multiplying by the repeat number for each parameters set.
self cormas displaySimNumber value: self simNumero printString , '/', self simNumber printString.
"
	
	^((self finalValue - self initValue) / self step) asInteger + 1