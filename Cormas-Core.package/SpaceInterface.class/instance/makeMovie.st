grid recorder
makeMovie
	"Create a movie from all *.jpg files setting in aMovFile directory.
aMovFile = <Filename>"
	
	| allJpegFiles anImage stream directory baseName |
	video ifNil: [^self].
	directory := video directory.
	baseName := (Cormas removeExtensionOf: video) tail.
	allJpegFiles := (directory filenamesMatching: baseName , '*.jpg')
		asSortedCollection: [:fn1 :fn2 | fn1 tail < fn2 tail].
	(JunImagesToMovie
		filename: video
		extent: self spatialGridArea extent)
		do:
			[:imagesToMovie | 
			allJpegFiles
				do:
					[:filename | 
					stream := JunJpegImageStream on: filename readStream.
					[Cursor read showWhile: [anImage := stream nextImage]]
						ensure: [stream close].
					imagesToMovie add: anImage milliseconds: 500]].
	self video: nil