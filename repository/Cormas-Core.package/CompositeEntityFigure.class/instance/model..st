accessing
model: anImage
	
	model := anImage.	"	model addDependent: self."
	self invalidate	"Tell the controller where to send menu messages."	"self controller performer: anOriginalFigure"