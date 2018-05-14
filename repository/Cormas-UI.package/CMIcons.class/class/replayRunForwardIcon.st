accessing - icons
replayRunForwardIcon
	"Private - Generated method"
	^ self icons
		at: #replayRunForwardIcon
		ifAbsentPut: [ Form
				fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self replayStoredSimIconContents readStream) ]