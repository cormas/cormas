accessing - icons
run1StepBackwardDisabledIcon
	"Private - Generated method"
	^ self icons
		at: #run1StepBackwardDisabledIcon
		ifAbsentPut: [ Form
				fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self run1StepBackwardDisabledIconContents readStream) ]