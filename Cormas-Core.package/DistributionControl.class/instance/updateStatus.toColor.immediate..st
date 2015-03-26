utiles
updateStatus: aWidgetID toColor: aColorValue immediate: aBoolean
	"update status region identified by widgetID with a green or red color. Show a transition gray for visual effect if aBoolean"
	
	aBoolean
		ifFalse:
			[self
				updateStatus: aWidgetID
				toColor: ColorValue gray
				immediate: true.
			(Delay forSeconds: 0.2) wait].
	(self wrapperAt: aWidgetID)
		ifNotNil:
			[:w | 
			| look |
			look := w lookPreferences copy.
			look setBackgroundColor: aColorValue.
			w lookPreferences: look].
	ScheduledControllers checkForEvents