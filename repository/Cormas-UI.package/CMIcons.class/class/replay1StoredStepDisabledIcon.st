accessing - icons
replay1StoredStepDisabledIcon
	"Private - Generated method"
	^ self icons
		at: #replay1StoredStepDisabledIcon
		ifAbsentPut: [ Form
				fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self replay1StoredStepDisabledIconContents readStream) ]