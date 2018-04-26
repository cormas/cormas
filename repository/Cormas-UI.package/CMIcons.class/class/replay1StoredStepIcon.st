accessing - icons
replay1StoredStepIcon
	"Private - Generated method"
	^ self icons
		at: #replay1StoredStepIcon
		ifAbsentPut: [ Form
				fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self replay1StoredStepIconContents readStream) ]