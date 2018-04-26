initialize-release
init
	
	self histoList
		list:
			(cormasModel class organization listAtCategoryNamed: #histograms)
				asSortedCollection asList