debuging
debugPovNameDefault
	
	self povMethods values
		do:
			[:c | c do: [:v | ('* ->D' match: v ignoreCase: false) ifTrue: [self halt]]]