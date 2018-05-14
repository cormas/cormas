accessing - icons
runSimIcon
	"Private - Generated method"
	^ self icons
		at: #runSimIcon
		ifAbsentPut: [ Form
				fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self runAllSimIconContents readStream) ]