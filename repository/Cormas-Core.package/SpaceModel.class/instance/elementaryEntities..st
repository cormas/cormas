private - accessing
elementaryEntities: x
	
	self spatialEntities
		at: self cormasModelClass cellClass name
		put: x	"(self dependents notNil and: [line * column > x size])
		ifTrue: [self vue mainInterface updateWindowName]"