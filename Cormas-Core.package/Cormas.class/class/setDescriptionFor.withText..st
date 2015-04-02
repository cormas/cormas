version
setDescriptionFor: method withText: text
	"Creates  a method for a CormasModel subclass from the text"
	
	| textWithoutQuote |
	textWithoutQuote := text copyReplaceAll: #($') with: #($").	"embedded quotes get doubled"
	self class
		compile:
			method ,
					'
^ ''' , textWithoutQuote , '''	'
		classified: 'version'
		notifying: nil