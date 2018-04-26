- activityEditor
methodsForControl
	"Return a set of manipulation methods of this class which are neither in #init, #testing, #pov #accessing #probes or #info protocols
	This is usefull if you want to manipulate your agent from a graphic interface or with the Manipulate Instances and Create Instances tools.
	The modeler can redefine this method in order to get the desired selectors. 
Example :
	methodsForControl
		^#(#step #reproduce #randomWalk)	"
	
	| coll |
	coll := self modelMethodsForManipulation
		- self methodsForTesting asOrderedCollection.
	^coll