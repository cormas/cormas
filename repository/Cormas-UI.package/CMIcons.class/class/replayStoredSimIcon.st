accessing - icons
replayStoredSimIcon
	"Private - Generated method"
	^ self icons
		at: #replayStoredSimIcon
		ifAbsentPut: [ Form
				fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self replayStoredSimIconContents readStream) ]