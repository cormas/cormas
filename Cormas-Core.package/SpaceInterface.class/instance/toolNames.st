tool hotDraw
toolNames
	"Return the list of names for the tools. 'nil' represents a space between tools in the icon bar.
	To each name (String), an icon should be associated at the class level and an initializeTool method should be design at the level of Tool class (these methods must be draged into Cormas Package)
	Ex: 'Inspect Tool'  -> inspectIcon -> initializeInspectTool
		'Manipulate Tool'  -> manipulateIcon -> initializeManipulateTool
		'Zoom Tool' -> zoomIcon -> initializeZoomTool"
	
	^#('Inspect Tool' 'Manipulate Tool' 'ChangeAttribute Tool' 'CreateEntity Tool' 'Zoom Tool' nil)