actions_menu
hide
	"Close the hideParameter interface and remove the parameters to be hidden from the main Parameter window"
	
	| theList |
	self closeAndUnschedule.
	self hiddenParametersInterface initFull.	"self hiddenParametersInterface classAttribValue_List list
		removeAllSuchThat: [:defaultAttrib | defaultAttrib isHidden].  optimisation pour ne pas que √ßa clignote : "
	theList := self hiddenParametersInterface classAttribValue_List list copy.
	self allAttributsList: theList copy.
	theList removeAllSuchThat: [:defaultAttrib | defaultAttrib isHidden].
	self hiddenParametersInterface classAttribValue_List list: theList.
	self saveCurrentSettings