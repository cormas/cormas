accessing - icons
runAllSimIcon
	"Private - Generated method"
	^ self icons
		at: #runAllSimIcon
		ifAbsentPut: [ Form
				fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self runAllSimIconContents readStream) ]