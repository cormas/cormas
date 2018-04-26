accessing - icons
defineScenarioIcon
	"Private - Generated method"
	^ self icons
		at: #defineScenarioIcon
		ifAbsentPut: [ Form
				fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self defineScenarioIconContents readStream) ]