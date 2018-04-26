accessing - icons
replaySimBackwardDisabledIcon
	"Private - Generated method"
	^ self icons
		at: #replaySimBackwardDisabledIcon
		ifAbsentPut: [ Form
				fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self replaySimBackwardDisabledIconContents readStream) ]