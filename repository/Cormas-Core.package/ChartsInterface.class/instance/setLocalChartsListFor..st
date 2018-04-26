menus
setLocalChartsListFor: entity
	
	| chartsToBeDisplayed |
	self levelClassName: entity.
	chartsToBeDisplayed := (self linkedSI isNil
		or: [self linkedSI siConfig isNil])
		ifTrue: [(self cormasModel_data at: entity) keys]
		ifFalse:
			[self linkedSI siConfig
				probeMethodsFor: entity class].
	self chartsList list: chartsToBeDisplayed asSortedCollection asList.
	self majIdList.
	(self builder componentAt: #chartsNames) beVisible.
	(self builder componentAt: #chartsList) beVisible.
	(self builder componentAt: #id) beVisible.
	(self builder componentAt: #idList) beVisible.
	self builder window
		label:
			'Charts - ' , self levelClassName asString , '     ' , self name value