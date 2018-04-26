accessing
collector
	"Getter accessor with default value = Collector new model: self "
	
	collector isNil ifTrue: [self setNewCollector].
	^collector