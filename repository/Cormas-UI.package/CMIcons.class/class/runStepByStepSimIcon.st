accessing - icons
runStepByStepSimIcon
	"Private - Generated method"
	^ self icons
		at: #runStepByStepSimIcon
		ifAbsentPut: [ Form
				fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self exec1StepIconContents readStream) ]