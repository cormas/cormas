initialize-release
obsolete
	
	[Tool reinitialize]
		on: Error
		do: [:ex | ex return: nil].
	super obsolete