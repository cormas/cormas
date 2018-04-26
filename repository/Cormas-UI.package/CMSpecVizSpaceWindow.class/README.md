CMSpecVizSpaceWindow new openWithSpec.

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points

| menuModel |
	
menuModel := CGStSpcMenuBuilder new 
	generateGroupSubMenuItems: 
		#(
		#(#Info #Track) 
		#(#SpatialDelimitor #Time #Background)
		#(#CellVsAggregates)
		).
Smalltalk tools workspace 
	openContents: menuModel 
	label: 'MenuModel Generator'.
