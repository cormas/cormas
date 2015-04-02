model entities
addSpatialEntityClass
	
	| interface |
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].
	interface := EntityAdditionInterface new.
	interface cormas: self.
	interface openInterface: #addSpatialEntity