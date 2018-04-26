callbacks
validateEntity

	| newClassName |
	
	(newClassName := self entityName textValuePending) isEmpty 
		ifTrue: [ ^ self informMessage: self translator tEnterClassName ].
	^ self owner addItem: newClassName trimBoth