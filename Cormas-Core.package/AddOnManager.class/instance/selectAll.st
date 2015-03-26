actions
selectAll
	
	self addOns_List
		refreshList: (self addOns_List list do: [:i | i shouldLoad: true])