- accessing
components: aList
	
	aList
		do:
			[:c | 
			c compoundSpatialClasses
				at: self class name
				put: self].
	components := aList