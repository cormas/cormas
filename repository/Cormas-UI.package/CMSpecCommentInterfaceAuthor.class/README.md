Represents each "row" with author information in Model Comments window.

| m |
m := DynamicComposableModel new.
m instantiateModels: #(item CMSpecCommentInterfaceAuth  ok OkToolbar).
m ok okAction: [ m window delete ].
m openWithSpecLayout: (SpecLayout composed
	newColumn: [: c | 
		c add: #item ;
			add: #ok height: 26 ];
	yourself).
	
CMSpecCommentInterfaceAuthor new openWithSpec.