callbacks
requestModelNameLocation
	" Open request dialog to select a load nodel location "
	
	| widget |
	widget := SpcListModel new.
	widget
		title: self translator tWhichOpeningLocation;
		items: self cormasOpenLocations.
	widget openDialogWithSpec modalRelativeTo: self currentWorld.
	^ widget selectedItem		
		