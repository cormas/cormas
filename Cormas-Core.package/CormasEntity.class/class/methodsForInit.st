+ utilities - methods - manipulation
methodsForInit
	"Purpose: returns a list of init method names
This is usefull if you want to manipulate the agents from a graphic interface or with the 'Manipulate Instances' and 'Create Instances' tools.
Return value: a collection of symbols
This method can be overwritten. 
Example :
	methodsForInit
		^#(#initWithRandomEnergy #initWithMaxEnergy)	"
	
	^self methodsOfProtocol: #init