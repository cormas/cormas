Extension { #name : #CMProbe }

{ #category : #'*Cormas-UI' }
CMProbe >> color [

	^ [ CMColor perform: colorString asSymbol ]
			onErrorDo: [ Color fromHexString: colorString ].
]
