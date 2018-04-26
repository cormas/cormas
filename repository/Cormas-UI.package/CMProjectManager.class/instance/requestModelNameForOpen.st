callbacks
requestModelNameForOpen
	" Open request dialog to select a file "
	
	| widget |
	widget := SpcListModel new.
	widget
		title: self translator tWhichModel;
		items: self cormasModels.
	widget openDialogWithSpec modalRelativeTo: self currentWorld.
	^ widget selectedItem		
		