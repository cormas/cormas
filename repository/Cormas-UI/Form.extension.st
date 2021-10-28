Extension { #name : #Form }

{ #category : #'*Cormas-UI' }
Form >> compileAsIconIn: aClass unarySelector: aString [

	| writeStream encoded |
	writeStream := WriteStream on: ByteArray new.
	PNGReadWriter putForm: self onStream: writeStream.
	encoded := writeStream contents base64Encoded.
	aClass compile: (String << [ : s |
	    s
			<< aString;
        	crtab;
			<< $^;
			<< $';
			<< encoded;
			<< $' ]).
]
