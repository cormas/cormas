initialize-release
initialize
	"super initialize."
	
	selections := OrderedCollection new.
	handles := OrderedCollection new.
	model := nil.
	state := 64.
	components := OrderedCollection new.
	self
		lineWidth: 1;
		lineColor: ColorValue black;
		selectable: false;
		moveable: false;
		removeable: false;
		connectable: false	"Set the default properties of figures, someone must do this..."