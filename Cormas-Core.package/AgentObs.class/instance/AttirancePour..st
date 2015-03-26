attirance
AttirancePour: unAgent
	"	nbAmis = 0



		ifTrue: [^false]



		ifFalse: [^(preferences at: unAgent)



				>= (nbMsg / nbAmis)]"
	
	^(preferences at: unAgent) > 0