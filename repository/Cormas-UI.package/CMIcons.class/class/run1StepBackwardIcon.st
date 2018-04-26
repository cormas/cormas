accessing - icons
run1StepBackwardIcon
	"Private - Generated method"
	^ self icons
		at: #run1StepBackwardIcon
		ifAbsentPut: [ Form
				fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self run1StepBackwardIconContents readStream) ]