initialize-release
initRunWindow
	
	self currentAnalysedAttribute: nil.
	self classAttribValueAnalysis_List list: self parametersToAnalyse.
	self finalStep value > 0
		ifFalse:
			[self cormas cycle value > 0
				ifTrue: [self finalStep value: self cormas cycle value]].
	super initRunWindow