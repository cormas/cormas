user message
choose: messageString labels: labels values: values default: defaultValue
	
	^Dialog
		choose: messageString
		labels: labels
		values: values
		default: defaultValue
		for: self mainWindow