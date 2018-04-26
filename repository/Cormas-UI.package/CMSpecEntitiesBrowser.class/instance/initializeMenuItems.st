initialization
initializeMenuItems
	" Private - Set the menu options for receiver's lists "

	self spatialList menu: [ self menuForSpatialList ].
	self socialList menu: [ self menuForSocialList ].
	self passiveList menu: [ self menuForPassiveList ].