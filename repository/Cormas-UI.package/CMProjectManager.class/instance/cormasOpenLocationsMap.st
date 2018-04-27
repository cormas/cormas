callbacks
cormasOpenLocationsMap
	" Answer a Collection of valid locations for opening a Cormas model "

	^ Dictionary new
		at: 'Local Disk' 		put: #requestModelOpenFromLocalDisk;
		at: 'URL' 				put: #requestModelOpenFromURL;
		at: 'Local image' 		put: #requestModelOpenFromLocalImage;
		at: 'Remote image'		put: #requestModelOpenFromRemoteImage;
		yourself 