private
buildDrawing
	
	drawing := self drawingClass new.
	drawing model: self.
	^drawing