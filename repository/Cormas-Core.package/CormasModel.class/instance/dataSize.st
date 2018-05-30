probes - recording
dataSize
	((self data includesKey: self class name)
		and: [ (self data at: self class name) isNotEmpty ])
		ifTrue: [ ^ (self data at: self class name) values first size ].
	self data isEmpty
		ifFalse: [ self data
				valuesDo: [ :coll | 
					coll
						valuesDo: [ :coll2 | 
							coll2
								valuesDo: [ :coll3 | 
									coll3 size > 0
										ifTrue: [ ^ coll3 size ] ] ] ] ].
	^ 0