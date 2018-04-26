accessing - icons
replaySimBackwardIcon
	"Private - Generated method"
	^ self icons
		at: #replaySimBackwardIcon
		ifAbsentPut: [ Form
				fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self replaySimBackwardIconContents readStream) ]