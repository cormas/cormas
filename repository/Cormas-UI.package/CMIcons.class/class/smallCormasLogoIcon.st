accessing - icons
smallCormasLogoIcon
	"Private - Generated method"
	^ self icons
		at: #smallCormasLogoIcon
		ifAbsentPut: [ Form
				fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self smallCormasLogoIconContents readStream) ]