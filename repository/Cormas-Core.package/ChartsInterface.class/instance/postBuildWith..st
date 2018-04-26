interface opening
postBuildWith: anUIBuilder
	
	chartsView := (anUIBuilder componentAt: #charts) widget.
	(anUIBuilder componentAt: #chartsNames) beInvisible.
	(anUIBuilder componentAt: #chartsList) beInvisible.
	(anUIBuilder componentAt: #id) beInvisible.
	(anUIBuilder componentAt: #idList) beInvisible.
	self initMenu.
	chartsView grid y manualScale