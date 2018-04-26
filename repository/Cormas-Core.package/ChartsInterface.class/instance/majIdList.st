private
majIdList
	
	idList
		list:
			((self cormasModel_data at: self levelClassName)
				at:
					(self cormasModel_data at: self levelClassName) keys asOrderedCollection
						first) keys asList