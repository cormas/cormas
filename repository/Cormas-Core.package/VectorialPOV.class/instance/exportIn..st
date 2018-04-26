private
exportIn: aStream
	"Methode modifi√©e par NB le 10/1/2010"
	"Export the atributes value of the VectorialPOV into a stream, to save it on the disk (in .EV file)
Ex:  Robot VectorialElementaryPOV happy [followed by the attribute values of the VectorialPOV]
The attribute values saved are (in order) 
-the internal color of the shape (RGB format)
-outine color (RGB format)
-outline width
-relative size of the shape
-position of the shape in the cell
-the coordinates of the vertices of the polyline making the shape of the VectorialPOV"
	
	aStream
		nextPutAll:
			self color red printString , ' ' , self color green printString , ' '
				, self color blue printString , ' '.
	aStream
		nextPutAll:
			self lineColor red printString , ' ' , self lineColor green printString ,
					' ' , self lineColor blue printString , ' '.
	aStream nextPutAll: self lineWidth printString , ' '.
	aStream nextPutAll: self sizeRatio printString , ' '.
	aStream nextPutAll: self position asString , ' '.
	aStream nextPutAll: self outline vertices printString , ' '.	"aStream nextPutAll: self isStroked printString , ' '."	"stroke ne sert plus √† rien a priori dans Cormas MVC"
	aStream nextPutAll: '\' withCRs