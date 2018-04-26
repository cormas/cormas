accessing - icons
exec1StepIcon
	"Private - Generated method"
	^ self icons
		at: #exec1StepIcon
		ifAbsentPut: [ Form
				fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self exec1StepIconContents readStream) ]