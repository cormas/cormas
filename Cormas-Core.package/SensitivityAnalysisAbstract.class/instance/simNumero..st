accessing
simNumero: aNb
	
	simNumero := aNb.
	self displaySimNumber
		value: aNb asString , '/' , self totalSimNumberWithRepeat asString