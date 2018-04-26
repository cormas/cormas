drawing description
toolNames
	"Return the list of names for the tools. 'nil' represents a space between tools in the icon bar.
	To each name (String), an icon should be associated at the class level and an initializeTool method should be design at the level of Tool class (these methods must be draged into Cormas Package)
	Ex: 'Inspect Tool'  -> inspectIcon -> initializeInspectTool
		'Manipulate Tool'  -> manipulateIcon -> initializeManipulateTool
		'Zoom Tool' -> zoomIcon -> initializeZoomTool

	To add a new toolState in the States dictionary of Tool, you must define it from the StateTransition Diagram. Ex with 'Activity Tool' :
In Tool class, create a method called #initializeActivityTool from the #initializeInspectTool method (changing the name of the method and accept will create the new method). Then open the editor by evaluating the comment and create 'Activity Tool' as initial state. Do whatever transitions you want, verify the diagram and compile it as #initializeActivityTool
"
	
	^#('Selection Tool' nil 'Delete Tool' 'Bring To Front Tool' 'Send To Back Tool' nil 'StartDot Tool' 'StopDot Tool' nil 'Activity Tool' 'Condition Tool')