grid recorder
snapGridInJpgFile: filename
	
	| image stream |
	"Un petit refresh juste avant la photo..."
	self drawing invalidate.	"Clic clac..."
	image := self screenImage.
	stream := JunJpegImageStream on: filename writeStream.
	[JunCursors cameraCursor showWhile: [stream nextPutImage: image]]
		valueNowOrOnUnwindDo: [stream close]