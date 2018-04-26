callbacks
cormasModels
	" Answer a <Collection> of <String> with receiver's available models "
	
	^ Cormas modelsPath entries collect: #basename