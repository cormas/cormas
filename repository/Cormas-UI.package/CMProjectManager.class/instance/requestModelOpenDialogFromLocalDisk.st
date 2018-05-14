callbacks
requestModelOpenDialogFromLocalDisk
	" Open a Cormas model. Answer project creation status, <true> if project was opened successfully "

	| widget |
	widget := SpcListModel new.
	widget
		title: self translator tWhichModel;
		items: self cormasModels.
	widget openDialogWithSpec modalRelativeTo: self currentWorld.
	^ widget selectedItem