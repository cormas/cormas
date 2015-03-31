menus
contextualMenu
	"See SpaceController and VectorialFigure #menuAt:"
	
	| aMenuBuilder tmp menuUpdated |
	aMenuBuilder := MenuBuilder new.
	tmp := self
		fillContextualMenu: aMenuBuilder
		forClasses: self model cormasModelClass spatialClasses asList.
	tmp isEmpty ifFalse: [aMenuBuilder line].
	tmp := self
		fillContextualMenu: aMenuBuilder
		forClasses: self model cormasModelClass socialClasses asList.
	tmp isEmpty ifFalse: [aMenuBuilder line].
	tmp := self
		fillContextualMenu: aMenuBuilder
		forClasses: self model cormasModelClass locatedObjectClasses asList.
	menuUpdated := self setCheck: aMenuBuilder menu.
	self controller menuHolder value isNil not
		ifTrue:
			[menuUpdated selectionMemory: self controller menuHolder selectionMemory].
	self controller menuHolder: menuUpdated