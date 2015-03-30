+ utilities - methods - manipulation
methodsForControl
	"Purpose: returns a list of method names that are NOT in the protocols #init, #testing, #pov #accessing #probes or #info.
This is usefull if you want to manipulate the agents from a graphic interface or with the 'Manipulate Instances' and 'Create Instances' tools.
Return value: <a collection of symbols>
To customize the contextual menu, this method can be overwritten as following.
Example :
	methodsForControl
		^#(#step #reproduce #randomWalk)	"
	
	| coll |
	coll := self modelMethodsForManipulation - self methodsForInit
		- self methodsForTesting asOrderedCollection.
	coll
		addAll:
			(self methodsOfProtocolStartingWith: '* ') - self methodsForInit
				- self methodsForTesting
				- (self methodsOfProtocolStartingWith: '* accessing')
				- (self methodsOfProtocolStartingWith: '* info')
				- (self methodsOfProtocolStartingWith: '* pov').
	^coll