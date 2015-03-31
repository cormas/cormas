private-sax
startElement: namespaceURI localName: localName qName: name attributes: someAttributes
	
	| selector |
	selector := self class saxElementHandlers
		at: localName
		ifAbsent:
			[self errorHandler
				fatalError:
					(InvalidSignal new
						messageText: #unknownTag << #xml >> 'unknown tag was encountered')].
	self perform: selector with: someAttributes