utiles
updateWidget: widgetID label: newLabel
	"update the string label of a widget"
	
	(self widgetAt: widgetID) ifNotNil: [:w | w labelString: newLabel]