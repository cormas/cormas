parametres
ellipseChanged
	
	changedOK
		ifTrue:
			[vueEllipse a: aHolder value.
			vueEllipse b: bHolder value.
			vueEllipse extent: extentHolder value.
			vueEllipse compute]