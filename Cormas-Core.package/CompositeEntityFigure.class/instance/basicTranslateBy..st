transforming
basicTranslateBy: aPoint
	"il faut aussi transferrer les contours de l'agr√©gat"
	
	| newDelimitors |
	super basicTranslateBy: aPoint.
	newDelimitors := OrderedCollection new: self delimitors size.
	self delimitors
		do: [:aPolyline | newDelimitors add: (aPolyline translatedBy: aPoint)].
	self delimitors: newDelimitors