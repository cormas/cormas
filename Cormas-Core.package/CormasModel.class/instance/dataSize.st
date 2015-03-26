probes - recording
dataSize
	
	((self data includesKey: self class name)
		and: [(self data at: self class name) isEmpty not])
		ifTrue: [^(self data at: self class name) values first size].
	self data isEmpty
		ifFalse:
			[self data values
				do:
					[:coll | 
					coll values
						do:
							[:coll2 | coll2 values do: [:coll3 | coll3 size > 0 ifTrue: [^coll3 size]]]]].
	^0