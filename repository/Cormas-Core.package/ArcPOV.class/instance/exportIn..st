private
exportIn: aStream
	"Export the atributes value of the ArcPOV into a stream, to save it on the disk (in .EV file)"
	
	aStream
		nextPutAll:
			self lineColor red printString , ' ' , self lineColor green printString ,
					' ' , self lineColor blue printString , ' '.
	aStream nextPutAll: self lineWidth printString , ' '.
	aStream nextPutAll: self startAnnotation printString , ' '.
	aStream nextPutAll: self stopAnnotation printString , ' '.	"aStream nextPutAll: self isStroked printString , ' '."	"stroke ne sert plus √† rien a priori dans Cormas MVC"
	aStream nextPutAll: '\' withCRs