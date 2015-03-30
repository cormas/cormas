submenu
submenuHolder
	"Answer the submenuHolder (or nil if none) to appear with items to be choosen if the receiver is going to be chosen."
	
	adornment == nil
		ifTrue: [^nil]
		ifFalse: [^adornment submenuHolder]