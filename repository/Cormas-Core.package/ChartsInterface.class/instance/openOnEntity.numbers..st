interface opening
openOnEntity: entityName numbers: ids
	
	(self cormasModel_data includesKey: entityName)
		ifTrue:
			[self open.
			self setLocalChartsListFor: entityName.
			self chartsList
				selections: entityName class probes asList.
			self idList selections: ids asList]