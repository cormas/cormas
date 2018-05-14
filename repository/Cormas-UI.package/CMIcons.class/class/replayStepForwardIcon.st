accessing - icons
replayStepForwardIcon
	"Private - Generated method"
	^ self icons
		at: #replayStepForwardIcon
		ifAbsentPut: [ Form
				fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self replay1StoredStepIconContents readStream) ]