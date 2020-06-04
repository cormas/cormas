Extension { #name : #ZnCharacterReadStream }

{ #category : #'*Cormas-Core' }
ZnCharacterReadStream >> skipSeparators [

	[ self atEnd ]
		whileFalse: [
			self next isSeparator ifFalse: [ ^ self position: self position - 1 ] ]
]
