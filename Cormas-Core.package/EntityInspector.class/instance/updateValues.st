methods
updateValues
	
	self prepareTable.
	self entityIdField value: self entityId.
	self resetLabel.
	self buildButtonColumn: builder