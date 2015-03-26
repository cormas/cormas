- activityEditor
methodsForTesting
	"Return a set of all the methods which are in protocols starting by '* testing'
	This is usefull if you want to manipulate your agent with Manipulate Instances tool
	The modeler can redefine this method in order to get the desired selectors. 
Example :
	methodsForTesting
		^#(#isRich #isLandOwner)	"
	
	| coll |
	coll := self methodsOfProtocol: #testing.
	coll addAll: (self methodsOfProtocol: '+ testing - scheduling' asSymbol).
	^coll