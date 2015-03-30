binary storage
representBinaryOn: bos
	
	^MessageSend
		receiver: self class
		selector: #newBoss:
		argument:
			(self isEmpty
				ifTrue: [#()]
				ifFalse: [self asArray])