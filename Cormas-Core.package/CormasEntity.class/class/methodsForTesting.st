+ utilities - methods - manipulation
methodsForTesting
	"Purpose: returns a list of all the methods in protocols starting by '* testing'
This is used by the interactive 'Manipulate Instances' tool
Return value: a collection of symbols
This method can be overwritten. 
Example :
	methodsForTesting
		^#(#isRich #isLandOwner)	"
	
	^self methodsOfProtocol: #testing