actions
closeRequest
	"comment stating purpose of message"
	
	| key |
	key := OrderedCollection new.
	key add: classe.
	key add: methode.
	legendes legendes remove: self.
	super closeRequest