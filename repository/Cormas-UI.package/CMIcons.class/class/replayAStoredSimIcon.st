accessing - icons
replayAStoredSimIcon
	"Private - Generated method"
	^ self icons
		at: #replayAStoredSimIcon
		ifAbsentPut: [ Form
				fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self replayAStoredSimIconContents readStream) ]