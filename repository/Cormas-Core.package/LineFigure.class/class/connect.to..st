instance creation
connect: aFigure to: anotherFigure
	
	| figure |
	figure := super connect: aFigure to: anotherFigure.
	figure addDependent: aFigure.
	figure addDependent: anotherFigure.
	figure addStopArrow.
	^figure