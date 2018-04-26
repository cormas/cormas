utils
imageResize: anImage horizontal: rX vertical: rY
	
	^anImage shrunkenBy: (Point x: rX y: rY)