utiles
updateStatus: aWidgetID toColor: aColorValue
	"update status region identified by widgetID with a green or red color. go to gray after a little time if aBoolean"
	
	self updateStatus: aWidgetID toColor: aColorValue immediate: false