- accessing - methods & classes
modelMethodsForManipulation
	"Return a set of all instance methods of this class and model upperclasses which are not in protocols #pov #accessing #probes #info"
	
	^self allMethodsButProtocols:
			#('star pov' '+ pov' 'pov' 'accessing' 'star accessing' '+ accessing' 'probes' '+ probes' 'star probes' 'star info' 'info' '+ info' 'obsolete' 'Obsolete' 'deprecated' 'Deprecated')