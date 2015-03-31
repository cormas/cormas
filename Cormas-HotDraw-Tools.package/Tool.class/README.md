Tool are used by drawings to manipulate the figures. They represent different strategies for manipulation. They contain a state diagram that describes their actions.

Instance Variables:
	controller	<DrawingController>	the controller for the drawing
	currentState	<ToolState>	the state we're currently in
	cursor	<Cursor>	the cursor that should be displayed
	data	<Dictionary>	data that can be passed from one state to another
	figure	<Figure>	the figure that the current event is for (this is used for efficiency)
	initialState	<ToolState>	the state that this tool initially starts in
	passInputDown	<Boolean>	should we pass input through to subviews or consume it ourselves

Class Variables:
	Debug	<Boolean>	when set to true, prints the state name to the transcript when it is enter
	States	<Dictionary key: String value: EndToolState>	our collection of tool states

