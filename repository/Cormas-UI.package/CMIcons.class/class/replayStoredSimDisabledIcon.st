accessing - icons
replayStoredSimDisabledIcon
	"Private - Generated method"
	^ self icons
		at: #replayStoredSimDisabledIcon
		ifAbsentPut: [ Form
				fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self replayStoredSimDisabledIconContents readStream) ]