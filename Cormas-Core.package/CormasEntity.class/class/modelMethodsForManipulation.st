- accessing - methods & classes
modelMethodsForManipulation
	"Return a set of all instance methods of this class and model upperclasses which are not in protocols #pov #accessing #probes #info"
	
	^self allMethodsButProtocols:
			#('* pov' '+ pov' 'pov' 'accessing' '* accessing' '+ accessing' 'probes' '+ probes' '* probes' '* info' 'info' '+ info' 'obsolete' 'Obsolete' 'deprecated' 'Deprecated')