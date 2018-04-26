save-load
loadSIconfig: aConfigSpec in: aSIConfig ofModel: aModel
	
	| stream line aL data collec aClass configElement |
	aSIConfig manipMethods: Dictionary new.
	aSIConfig defaultPov: nil.
	aSIConfig defaultInfo: nil.
	stream := aConfigSpec readStream.
	[stream atEnd]
		whileFalse:
			[line := Cormas splitLine: stream sep: $*.
			configElement := (line first
				copyFrom: 1
				to: line first size - 1) asSymbol.
			configElement = #configName
				ifTrue: [aSIConfig configName value: line last].
			(#(#observedEntitiesList #manipEntitiesList #createEntitiesList)
				refersToLiteral: configElement)
				ifTrue:
					[aL := List new.
					(Cormas
						splitLine: line last readStream
						sep: $,)
						do:
							[:i | 
							aClass := (Cormas stringAsObjectType: i) class.
							aClass ifNotNil: [aL add: aClass]].
					(aSIConfig perform: configElement) setList: aL selecting: ''].
			(#(#manipMethods #povMethods #attributes #infoMethods #probeMethods)
				refersToLiteral: configElement)
				ifTrue:
					[data := (Cormas
						splitLine: line last readStream
						sep: $,) asOrderedCollection.
					aClass := (Cormas stringAsObjectType: data removeFirst) class.
					aClass
						ifNotNil:
							[(aSIConfig perform: configElement)
								at: aClass
								put: (data collect: [:m | m asSymbol])]].
			(#(#canBeMoved #manipWholePop #canChangeValues) refersToLiteral:
					configElement)
				ifTrue:
					[data := (Cormas
						splitLine: line last readStream
						sep: $,) asOrderedCollection.
					aClass := (Cormas stringAsObjectType: data removeFirst) class.
					aClass
						ifNotNil:
							[(aSIConfig perform: configElement)
								at: aClass
								put: (Cormas stringAsObjectType: data first)]].
			(#(#defaultPov #defaultInfo) refersToLiteral: configElement)
				ifTrue:
					[data := (Cormas
						splitLine: line last readStream
						sep: $,) asOrderedCollection.
					aClass := (Cormas stringAsObjectType: data removeFirst) class.
					aClass
						ifNotNil:
							[(aSIConfig perform: configElement)
								at: aClass
								put: data first asSymbol]].
			configElement = #delimiterSize
				ifTrue:
					[data := (Cormas
						splitLine: line last readStream
						sep: $,) asOrderedCollection.
					data removeFirst.
					aSIConfig perform: data first asSymbol].
			configElement = #defaultTool
				ifTrue:
					[data := (Cormas
						splitLine: line last readStream
						sep: $,) asOrderedCollection.
					aSIConfig perform: data first asSymbol].
			configElement = #siMenuFormat
				ifTrue:
					[data := (Cormas
						splitLine: line last readStream
						sep: $,) asOrderedCollection.
					aSIConfig perform: data first asSymbol].
			configElement = #isUndoRedoEnabled
				ifTrue:
					[data := (Cormas
						splitLine: line last readStream
						sep: $,) asOrderedCollection first.
					aSIConfig isUndoRedoEnabled: (Cormas stringAsObjectType: data)].
			configElement = #isManipulateForTabletEnabled
				ifTrue:
					[data := (Cormas
						splitLine: line last readStream
						sep: $,) asOrderedCollection first.
					aSIConfig
						isManipulateForTabletEnabled: (Cormas stringAsObjectType: data)].
			configElement = #isSingleDefaultPovShown
				ifTrue:
					[data := (Cormas
						splitLine: line last readStream
						sep: $,) asOrderedCollection first.
					aSIConfig isSingleDefaultPovShown: (Cormas stringAsObjectType: data)].
			configElement = #isSingleDefaultInfoShown
				ifTrue:
					[data := (Cormas
						splitLine: line last readStream
						sep: $,) asOrderedCollection first.
					aSIConfig isSingleDefaultInfoShown: (Cormas stringAsObjectType: data)].
			configElement = #trackLengthValue
				ifTrue:
					[data := (Cormas
						splitLine: line last readStream
						sep: $,) asOrderedCollection.
					data removeFirst.
					aSIConfig
						applyTrackLengthValue: (Cormas stringAsObjectType: data first)].
			configElement = #trackedAgents
				ifTrue:
					[collec := Set new.
					line size = 1
						ifFalse:
							[(Cormas
								splitLine: line last readStream
								sep: $,)
								do: [:i | collec add: (Cormas stringAsObjectType: i) asSymbol]].
					aSIConfig trackedAgents: collec]].
	stream close