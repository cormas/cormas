accessing
distributionListAsString
	
	self distributionList ifNil: [^''].
	^self distributionList asString