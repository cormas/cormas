menus
initMenuAttributs
	"Set the sub menu 'clicToChange for the attributes of a Cell"
	
	| menuAttributs menuDyn lesAttributs activeClass |
	lesAttributs := List new.
	activeClass := self activeSpatialEntity.	"activeClass := self model cormasModel class environment at: model activeSpatialEntity."
	lesAttributs := activeClass allInstVarNames.
	(activeClass inheritsFrom: CMSpatialEntityElement)
		ifTrue: [lesAttributs removeAll: CMSpatialEntityElement allInstVarNames].
	(activeClass inheritsFrom: CMSpatialEntitySet)
		ifTrue: [lesAttributs removeAll: CMSpatialEntitySet allInstVarNames].
	menuDyn := ((self menuHolder value atNameKey: #tools) submenu atNameKey:
			#clicTo) submenu atNameKey: #clicToChange.
	menuAttributs := Menu new.
	1
		to: lesAttributs size
		do:
			[:i | 
			| attribut |
			attribut := lesAttributs at: i.
			menuAttributs
				addItemLabel: attribut
				value:
					[self drawing activeAttribute: attribut.
					self clicToChange]].
	menuDyn submenu: menuAttributs