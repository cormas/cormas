examples
example2
	"Open a drawing editor with a browser inside."
	"self example2"
	
	| editor |
	editor := self new.
	editor open.
	editor drawing
		add:
			(ViewAdapterFigure
				view:
					(FileBrowser new allButOpenInterface: #windowSpec) window component
				in: (10 @ 10 corner: 450 @ 350))