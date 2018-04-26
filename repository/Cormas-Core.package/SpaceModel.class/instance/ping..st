private - notification
ping: anObject
	
	^[anObject ping]
		on: Exception
		do: [:ex | false]