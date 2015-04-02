examples
example1
	"Open a drawing editor with another drawing inside."
	"self example1"
	
	| editor |
	editor := self new.
	editor open.
	editor drawing
		add:
			(ViewAdapterFigure
				view:
					(DrawingEditor new allButOpenInterface: #windowSpec) window component
				in: (10 @ 10 corner: 450 @ 350))