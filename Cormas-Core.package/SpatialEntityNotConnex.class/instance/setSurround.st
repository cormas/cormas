- initialize-release
setSurround
	
	self components first isSpatialEntityElement ifTrue: [^super setSurround].
	self surround: Set new.
	self components
		do: [:aComponent | self surround addAll: aComponent surround].
	self surround: self surround asOrderedCollection.
	^self surround