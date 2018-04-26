menu-symbol
setModelClass: aClass
	
	super setModelClass: aClass.	"set the background color adapted to class"
	(aClass inheritsFrom: CMAgent)
		ifFalse:
			[(self builder componentAt: #fond) component component
				insideColor: (Color red: 1.0 green: 0.624954 blue: 0.250031)].
	self initMenuAddSameAs