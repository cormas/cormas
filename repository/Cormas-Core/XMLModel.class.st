"
This class represents the model in XML form.

It has three functions:
- it will generate a skeleton modele.xml file from the information available in the model.
- it will parse modele.xml to know how to log playback information
- it will generate a structure to call a remote function of the visualizer to transmit the model.

The class is instantiated with a path to the modele.xml file (currently XML/modele.xml).
If the file exists, it is loaded. Any conflict with the model is reported to the user. If the file doesn't exist, a skeleton without the grammar is generated.

Then, you can call the buildXmlRpcModelRepresentation method to send the model to the external visualizer via xml-rpc.
"
Class {
	#name : #XMLModel,
	#superclass : #Object,
	#instVars : [
		'dimX',
		'dimY',
		'connexity',
		'delimiter',
		'boundaries',
		'attributes',
		'views',
		'currentView',
		'agents',
		'model',
		'filepath',
		'xmlRpcClient',
		'playbackLogStream'
	],
	#classInstVars : [
		'saxElementHandlers'
	],
	#category : #'Cormas-Core-Tools'
}

{ #category : #'initialize-release' }
XMLModel class >> closePlaybackLog: aStream [
	
	
]

{ #category : #paths }
XMLModel class >> defaultFilePath: aModel [
	"From a model, return the default file path of the modele.xml file"
	
	^(Cormas xmlPath: aModel class name) construct: 'modele.xml'
]

{ #category : #paths }
XMLModel class >> newPlaybackLogPath: aModel [
	"From a model, return a new path for a partie.xml file"
	
	| xmlBase index |
	xmlBase := Cormas xmlPath: aModel class name.
	index := 1.
	[| path |
	path := xmlBase construct: 'partie-' , index printString , '.xml'.
	path exists ifFalse: [^path].
	index := index + 1] repeat
]

{ #category : #'private-sax' }
XMLModel class >> resetSaxElementHandlers [
	
	saxElementHandlers := nil
]

{ #category : #'private-sax' }
XMLModel class >> saxElementHandlers [
	
	saxElementHandlers isNil
		ifTrue:
			[saxElementHandlers := Dictionary new.
			saxElementHandlers at: 'modele' put: #ignoreElement:.
			saxElementHandlers at: 'dimension' put: #startElementDimension:.
			saxElementHandlers at: 'cloture' put: #startElementCloture:.
			saxElementHandlers at: 'connexite' put: #startElementConnexite:.
			saxElementHandlers at: 'delimiteur' put: #startElementDelimiteur:.
			saxElementHandlers at: 'attributs' put: #ignoreElement:.
			saxElementHandlers at: 'att' put: #startElementAtt:.
			saxElementHandlers at: 'vues' put: #ignoreElement:.
			saxElementHandlers at: 'vue' put: #startElementVue:.
			saxElementHandlers at: 'grammaire' put: #startElementGrammaire:.
			saxElementHandlers at: 'comp' put: #startElementComp:.
			saxElementHandlers at: 'legende' put: #startElementLegende:.
			saxElementHandlers at: 'attribut' put: #startElementAttribut:.
			saxElementHandlers at: 'seuil' put: #startElementSeuil:.
			saxElementHandlers at: 'urls' put: #startElementUrls:.
			saxElementHandlers at: 'vueref' put: #startElementVueref:.
			saxElementHandlers at: 'agents' put: #ignoreElement:.
			saxElementHandlers at: 'classe' put: #startElementClasse:].
	^saxElementHandlers
]

{ #category : #'initialize-release' }
XMLModel class >> with: aModel [
	"Create a new instance of XMLModel and initialize it with a model and the default path of the xml file"
	
	^self
		with: aModel
		on: (self defaultFilePath: aModel)
]

{ #category : #'initialize-release' }
XMLModel class >> with: aModel on: aFilePath [
	"Create a new instance of XMLModel and initialize it with a model and a path to the xml file"
	
	^self new with: aModel on: aFilePath
]

{ #category : #'xml-rpc' }
XMLModel >> buildDisplayMapXmlRpcRepresentation [
	"Return an XML-RPC representation of the map for the display method"
	
	| spaceModel repMap repDisplay |
	spaceModel := model spaceModel.
	repMap := spaceModel elementaryEntities
		collect:
			[:entity | 
			| repCell |
			repCell := Dictionary new.
			attributes
				do:
					[:att | 
					| value |
					value := entity perform: (att at: #name) asSymbol.
					repCell
						at: (att at: #id)
						put:
							(value isNil
								ifTrue: ['nil']
								ifFalse: [value printString])].
			repCell].
	repDisplay := Dictionary new.
	repDisplay at: 'Carte' put: repMap.
	^repDisplay
]

{ #category : #'xml-rpc' }
XMLModel >> buildDisplayXmlRepOfAgentLeaveOf: anAgentLocation from: srcSpatialEntity [
	"Return an XML-RPC representation of the map for the display method"
	
	| repDisplay repMove |
	repMove := Dictionary new.
	repMove
		at: 'IdAgent'
		put: anAgentLocation id.
	repMove
		at: 'Classe'
		put: anAgentLocation class name.
	repMove at: 'Type' put: 'supprAgent'.
	repMove
		at: 'Case'
		put: srcSpatialEntity id.
	repDisplay := Dictionary new.
	repDisplay
		at: 'Agents'
		put: (Array with: repMove).
	^repDisplay
]

{ #category : #'xml-rpc' }
XMLModel >> buildDisplayXmlRepOfAgentMoveOf: anAgentLocation from: srcSpatialEntity to: dstSpatialEntity [
	"Return an XML-RPC representation of the map for the display method"
	
	| repDisplay repMove |
	repMove := Dictionary new.
	repMove
		at: 'IdAgent'
		put: anAgentLocation id.
	repMove
		at: 'Classe'
		put: anAgentLocation class name.
	srcSpatialEntity isNil
		ifTrue:
			[repMove at: 'Type' put: 'ajoutAgent'.
			repMove
				at: 'Case'
				put: dstSpatialEntity id]
		ifFalse:
			[repMove at: 'Type' put: 'deplacerAgent'.
			repMove
				at: 'From'
				put: srcSpatialEntity id.
			repMove
				at: 'To'
				put: dstSpatialEntity id].
	repDisplay := Dictionary new.
	repDisplay
		at: 'Agents'
		put: (Array with: repMove).
	^repDisplay
]

{ #category : #'xml-rpc' }
XMLModel >> buildXmlRpcModelRepresentation [
	"Return an XML-RPC representation of the model"
	
	| repModel repViews repAtts repAgents |
	repViews := List
		withAll:
			(views keys
				collect:
					[:idView | 
					| view repView |
					view := views at: idView.
					repView := Dictionary new.
					repView
						at: 'Id'
						put: idView asNumber.
					view
						at: #type
						ifPresent: [:type | repView at: 'Type' put: type].
					view
						at: #grammaire
						ifPresent:
							[:grammaire | 
							| repComp |
							repView
								at: 'EntiteGrammaire'
								put: grammaire first.
							repComp := List new.
							2
								to: grammaire size
								do: [:index | repComp add: (grammaire at: index)].
							repView at: 'ComplementGrammaire' put: repComp].
					view
						at: #legende
						ifPresent: [:legende | repView at: 'Legende' put: legende].
					view
						at: #attribut
						ifPresent:
							[:attribut | 
							repView
								at: 'IdRef'
								put: (attribut at: #ref) asNumber.
							attribut
								at: #couleur
								ifPresent: [:couleur | repView at: 'Couleur' put: couleur].
							attribut
								at: #url
								ifPresent: [:url | repView at: 'URL' put: url].
							attribut
								at: #modif
								ifPresent: [:modif | repView at: 'Modif' put: modif]].
					view
						at: #seuil
						ifPresent:
							[:seuil | 
							repView
								at: 'Seuil1'
								put: seuil first.
							repView
								at: 'Seuil2'
								put: (seuil at: 2)].
					view
						at: #urls
						ifPresent:
							[:urls | 
							repView
								at: 'URL1'
								put: urls first.
							repView
								at: 'URL2'
								put: (urls at: 2)].
					view
						at: #vuerefs
						ifPresent:
							[:vuerefs | 
							repView
								at: 'VueRef'
								put: (vuerefs collect: [:vueref | vueref asNumber])].
					repView]).
	repAtts := List
		withAll:
			(attributes
				collect:
					[:attribute | 
					| repAtt |
					repAtt := Dictionary new.
					repAtt
						at: 'Id'
						put: (attribute at: #id).
					repAtt
						at: 'Name'
						put: (attribute at: #name).
					repAtt
						at: 'Type'
						put: (attribute at: #type).
					repAtt]).
	repAgents := List
		withAll:
			(agents keys
				collect:
					[:name | 
					| agentClass repAgentClass |
					agentClass := agents at: name.
					repAgentClass := Dictionary new.
					repAgentClass at: 'Name' put: name.
					repAgentClass
						at: 'URL'
						put: (agentClass at: #url).
					repAgentClass]).
	repModel := Dictionary new.
	repModel at: 'SizeX' put: dimX.
	repModel at: 'SizeY' put: dimY.
	repModel at: 'Connexite' put: connexity.
	repModel at: 'Delimiteur' put: delimiter.
	repModel at: 'VectVues' put: repViews.
	repModel at: 'Attributs' put: repAtts.
	repModel at: 'Agents' put: repAgents.
	^repModel
]

{ #category : #private }
XMLModel >> checkWithModel [
	"Check that what we read matches the model"
	
	| spaceModel cellClass |
	spaceModel := model spaceModel.
	cellClass := model class cellClass
]

{ #category : #'playback-log' }
XMLModel >> closePlaybackLog: aStream [
	"Close the playback log, writing the end of the XML stream"
	
	aStream
		nextPutAll: '</partie>';
		cr;
		close
]

{ #category : #'xml-rpc' }
XMLModel >> connectToExternalVisualizer [
	"Connect to external visualizer (via XML-RPC)"
	
	Dialog warn: 'Exernal visualization under reconstruction'.
	self halt	"	xmlRpcClient := XmlRpcClient host: 'localhost' port: 10080 path: 'Visualizer'.
	xmlRpcClient perform: 'Visualizer.loadModel' with: self buildXmlRpcModelRepresentation."
]

{ #category : #simulation }
XMLModel >> endStep [
	"Handle the end of the step"
	
	playbackLogStream isNil ifFalse: [self endStepPlaybackLog]
]

{ #category : #'playback-log' }
XMLModel >> endStepPlaybackLog [
	"Handle the end of the step for the log"
	
	playbackLogStream
		nextPutAll: '</step>';
		cr;
		flush
]

{ #category : #private }
XMLModel >> generateSkeletonXMLFile [
	"Generate a skeleton XML file from the model"
	
	| outputStream |
	outputStream := filepath writeStream.
	outputStream lineEndCRLF.
	self generateSkeletonXMLFileHeader: outputStream.
	self generateSkeletonXMLFileAttributes: outputStream.
	self generateSkeletonXMLFileViews: outputStream.
	self generateSkeletonXMLFileAgents: outputStream.
	self generateSkeletonXMLFileFooter: outputStream.
	outputStream close
]

{ #category : #private }
XMLModel >> generateSkeletonXMLFileAgents: aStream [
	"Generate the attributes part of the skeleton XML file"
	
	aStream
		nextPutAll: '<agents>';
		cr.
	aStream
		nextPutAll: '</agents>';
		cr
]

{ #category : #private }
XMLModel >> generateSkeletonXMLFileAttributes: aStream [
	"Generate the attributes part of the skeleton XML file"
	
	aStream
		nextPutAll: '<attributs>';
		cr.
	aStream
		nextPutAll: '</attributs>';
		cr
]

{ #category : #private }
XMLModel >> generateSkeletonXMLFileFooter: aStream [
	
	aStream
		nextPutAll: '</modele>';
		cr
]

{ #category : #private }
XMLModel >> generateSkeletonXMLFileHeader: aStream [
	"Generate the header of the skeleton XML file."

	| spaceModel |
	spaceModel := model spaceModel.
	aStream
		nextPutAll: '<?xml version="1.0" encoding="ISO-8859-1" ?>';
		cr;
		nextPutAll:
			'<!DOCTYPE modele PUBLIC "modele-xml" "http://www-poleia.lip6.fr/~guyot/files/modele-xml.dtd">';
		cr;
		nextPutAll: '<modele>';
		cr;
		nextPutAll:
			'<dimension x="' , spaceModel line printString , '" y="'
				, spaceModel column printString , '"/>';
		cr;
		nextPutAll:
			'<cloture value="'
				,
					(spaceModel closed
						ifTrue: [ 'closed' ]
						ifFalse: [ 'torroidal' ]) asString , '"/>';
		cr;
		nextPutAll: '<connexite value="' , spaceModel nbNeighbours printString , '"/>';
		cr;
		nextPutAll: '<delimiteur value="' , spaceModel delimiter printString , '"/>';
		cr
]

{ #category : #private }
XMLModel >> generateSkeletonXMLFileViews: aStream [
	"Generate the attributes part of the skeleton XML file"
	
	aStream
		nextPutAll: '<vues>';
		cr.
	aStream
		nextPutAll: '</vues>';
		cr
]

{ #category : #private }
XMLModel >> getCellClassAttributes [
	"Return a list of instance variables of the cell class that have a read and a write accessor in the #accessing protocol"
	
	| cellClass organization |
	cellClass := model class cellClass.
	organization := cellClass organization.
	cellClass instVarNames
		select:
			[:varName | 
			(organization categoryOfElement: varName asSymbol == #accessing)
				and:
					[organization categoryOfElement: (varName , ':') asSymbol == #accessing]]
]

{ #category : #'private-sax' }
XMLModel >> ignoreElement: someAttributes [
	"Ignore some element"
	
	
]

{ #category : #'playback-log' }
XMLModel >> openPlaybackLog [
	
	playbackLogStream := (self class newPlaybackLogPath: model) writeStream.
	playbackLogStream
		nextPutAll: '<?xml version="1.0" encoding="ISO-8859-1" ?>';
		cr;
		nextPutAll:
				'<!DOCTYPE partie PUBLIC "partie-xml" "http://www-poleia.lip6.fr/~corbara/partie-xml.dtd">';
		cr;
		nextPutAll: '<partie>';
		cr
]

{ #category : #private }
XMLModel >> parseXMLFile [
	"Parse the XML file (at filepath) and check the result concords with the model"
	
	| parser |
	parser := XMLParser on: filepath.
	parser saxDriver: self.	"parser validate: false."
	parser scanDocument.	"Reset variables"
	currentView := nil
]

{ #category : #'initialize-release' }
XMLModel >> release [
	
	super release.	"Close the playback stream, if any, and send quit message to the visualizer"
	xmlRpcClient isNil
		ifFalse:
			[| theClient |
			theClient := xmlRpcClient.
			xmlRpcClient := nil.
			[theClient perform: 'Visualizer.quit'.
			theClient release] fork].
	playbackLogStream isNil
		ifFalse:
			[| theStream |
			theStream := playbackLogStream.
			playbackLogStream := nil.
			self closePlaybackLog: theStream.
			theStream release]
]

{ #category : #'xml-rpc' }
XMLModel >> sendLeaveToExternalVisualizerOf: anAgent from: srcCell [
	
	xmlRpcClient
		perform: 'Visualizer.display'
		with: (self buildDisplayXmlRepOfAgentLeftOf: anAgent from: srcCell)
]

{ #category : #'xml-rpc' }
XMLModel >> sendMapToExternalVisualizer [
	"Send the map to the external visualizer"
	
	xmlRpcClient
		perform: 'Visualizer.display'
		with: self buildDisplayMapXmlRpcRepresentation
]

{ #category : #'xml-rpc' }
XMLModel >> sendMoveToExternalVisualizerOf: anAgent from: srcCell to: dstCell [
	
	xmlRpcClient
		perform: 'Visualizer.display'
		with:
			(self buildDisplayXmlRepOfAgentMoveOf: anAgent from: srcCell to: dstCell)
]

{ #category : #'private-sax' }
XMLModel >> startElement: namespaceURI localName: localName qName: name attributes: someAttributes [
	
	| selector |
	selector := self class saxElementHandlers
		at: localName
		ifAbsent:
			[self errorHandler
				fatalError:
					(InvalidSignal new
						messageText: #unknownTag << #xml >> 'unknown tag was encountered')].
	self perform: selector with: someAttributes
]

{ #category : #'private-sax' }
XMLModel >> startElementAtt: someAttributes [
	
	| att_id att_name att_type attribut |
	att_id := nil.
	att_name := nil.
	att_type := nil.
	someAttributes
		do:
			[:attribute | 
			(attribute key isLike: 'id')
				ifTrue: [att_id := attribute value]
				ifFalse:
					[(attribute key isLike: 'name')
						ifTrue: [att_name := attribute value]
						ifFalse:
							[(attribute key isLike: 'type') ifTrue: [att_type := attribute value]]]].
	(att_id isNil or: [att_name isNil or: [att_type isNil]])
		ifTrue:
			[self errorHandler
				fatalError:
					(InvalidSignal new
						messageText:
							#requiredAttributesNotPresent << #xml >>
									'att tags must have attributes called id, name and type')].
	attribut := Dictionary new.
	attribut at: #id put: att_id.
	attribut at: #name put: att_name.
	attribut at: #type put: att_type.
	attributes add: attribut
]

{ #category : #'private-sax' }
XMLModel >> startElementAttribut: someAttributes [
	
	| att_ref attribut |
	att_ref := nil.
	attribut := Dictionary new.
	someAttributes
		do:
			[:attribute | 
			(attribute key isLike: 'ref')
				ifTrue:
					[att_ref := attribute value.
					attribut at: #ref put: att_ref]
				ifFalse:
					[(attribute key isLike: 'couleur')
						ifTrue:
							[attribut
								at: #couleur
								put: attribute value]
						ifFalse:
							[(attribute key isLike: 'modif')
								ifTrue:
									[attribut
										at: #modif
										put: attribute value asBoolean]
								ifFalse:
									[(attribute key isLike: 'url')
										ifTrue:
											[attribut
												at: #url
												put: attribute value]]]]].
	att_ref isNil
		ifTrue:
			[self errorHandler
				fatalError:
					(InvalidSignal new
						messageText:
							#requiredAttributesNotPresent << #xml >>
									'attribut tag must have an attribute called ref')].
	currentView at: #attribut put: attribut
]

{ #category : #'private-sax' }
XMLModel >> startElementClasse: someAttributes [
	
	| att_name att_url agentClass |
	att_name := nil.
	att_url := nil.
	someAttributes
		do:
			[:attribute | 
			(attribute key isLike: 'name')
				ifTrue: [att_name := attribute value]
				ifFalse:
					[(attribute key isLike: 'url') ifTrue: [att_url := attribute value]]].
	(att_name isNil or: [att_url isNil])
		ifTrue:
			[self errorHandler
				fatalError:
					(InvalidSignal new
						messageText:
							#requiredAttributesNotPresent << #xml >>
									'class tag must have attributes called name and url')].
	agentClass := Dictionary new.
	agentClass
		at: #url value
		put: att_url.
	agents at: att_name put: agentClass
]

{ #category : #'private-sax' }
XMLModel >> startElementCloture: someAttributes [
	
	someAttributes
		do:
			[:attribute | 
			(attribute key isLike: 'value')
				ifTrue:
					[boundaries := attribute value asSymbol.
					^self]].
	self errorHandler
		fatalError:
			(InvalidSignal new
				messageText:
					#requiredAttributesNotPresent << #xml >>
							'cloture tag must have an attribute called value')
]

{ #category : #'private-sax' }
XMLModel >> startElementComp: someAttributes [
	
	| grammaire |
	grammaire := currentView at: #grammaire.
	someAttributes
		do:
			[:attribute | 
			(attribute key isLike: 'value')
				ifTrue:
					[grammaire add: attribute value.
					^self]].
	self errorHandler
		fatalError:
			(InvalidSignal new
				messageText:
					#requiredAttributesNotPresent << #xml >>
							'comp tag must have an attribute called value')
]

{ #category : #'private-sax' }
XMLModel >> startElementConnexite: someAttributes [
	
	someAttributes
		do:
			[:attribute | 
			(attribute key isLike: 'value')
				ifTrue:
					[connexity := attribute value asNumber.
					^self]].
	self errorHandler
		fatalError:
			(InvalidSignal new
				messageText:
					#requiredAttributesNotPresent << #xml >>
							'connexite tag must have an attribute called value')
]

{ #category : #'private-sax' }
XMLModel >> startElementDelimiteur: someAttributes [
	
	someAttributes
		do:
			[:attribute | 
			(attribute key isLike: 'value')
				ifTrue:
					[delimiter := attribute value asNumber.
					^self]].
	self errorHandler
		fatalError:
			(InvalidSignal new
				messageText:
					#requiredAttributesNotPresent << #xml >>
							'delimiteur tag must have an attribute called value')
]

{ #category : #'private-sax' }
XMLModel >> startElementDimension: someAttributes [
	
	| att_x att_y |
	att_x := nil.
	att_y := nil.
	someAttributes
		do:
			[:attribute | 
			(attribute key isLike: 'x')
				ifTrue: [att_x := attribute value asNumber]
				ifFalse:
					[(attribute key isLike: 'y') ifTrue: [att_y := attribute value asNumber]]].
	(att_x isNil or: [att_y isNil])
		ifTrue:
			[self errorHandler
				fatalError:
					(InvalidSignal new
						messageText:
							#requiredAttributesNotPresent << #xml >>
									'dimension tag must have attributes called x and y')].
	dimX := att_x.
	dimY := att_y
]

{ #category : #'private-sax' }
XMLModel >> startElementGrammaire: someAttributes [
	
	| grammaire |
	grammaire := List new.
	currentView at: #grammaire put: grammaire.
	someAttributes
		do:
			[:attribute | 
			(attribute key isLike: 'value')
				ifTrue:
					[grammaire add: attribute value.
					^self]].
	self errorHandler
		fatalError:
			(InvalidSignal new
				messageText:
					#requiredAttributesNotPresent << #xml >>
							'grammaire tag must have an attribute called value')
]

{ #category : #'private-sax' }
XMLModel >> startElementLegende: someAttributes [
	
	someAttributes
		do:
			[:attribute | 
			(attribute key isLike: 'ref')
				ifTrue:
					[currentView
						at: #legende
						put: attribute value.
					^self]].
	self errorHandler
		fatalError:
			(InvalidSignal new
				messageText:
					#requiredAttributesNotPresent << #xml >>
							'legende tag must have an attribute called ref')
]

{ #category : #'private-sax' }
XMLModel >> startElementSeuil: someAttributes [
	
	| att_val1 att_val2 seuil |
	att_val1 := nil.
	att_val2 := nil.
	someAttributes
		do:
			[:attribute | 
			(attribute key isLike: 'val1')
				ifTrue: [att_val1 := attribute value asNumber]
				ifFalse:
					[(attribute key isLike: 'val2')
						ifTrue: [att_val2 := attribute value asNumber]]].
	(att_val1 isNil or: [att_val2 isNil])
		ifTrue:
			[self errorHandler
				fatalError:
					(InvalidSignal new
						messageText:
							#requiredAttributesNotPresent << #xml >>
									'seuil tag must have attributes called val1 and val2')].
	seuil := Array with: att_val1 with: att_val2.
	currentView at: #seuil put: seuil
]

{ #category : #'private-sax' }
XMLModel >> startElementUrls: someAttributes [
	
	| att_val1 att_val2 urls |
	att_val1 := nil.
	att_val2 := nil.
	someAttributes
		do:
			[:attribute | 
			(attribute key isLike: 'val1')
				ifTrue: [att_val1 := attribute value]
				ifFalse:
					[(attribute key isLike: 'val2') ifTrue: [att_val2 := attribute value]]].
	(att_val1 isNil or: [att_val2 isNil])
		ifTrue:
			[self errorHandler
				fatalError:
					(InvalidSignal new
						messageText:
							#requiredAttributesNotPresent << #xml >>
									'urls tag must have attributes called val1 and val2')].
	urls := Array with: att_val1 with: att_val2.
	currentView at: #seuil put: urls
]

{ #category : #'private-sax' }
XMLModel >> startElementVue: someAttributes [
	
	| att_type att_id |
	att_type := nil.
	att_id := nil.
	someAttributes
		do:
			[:attribute | 
			(attribute key isLike: 'type')
				ifTrue: [att_type := attribute value]
				ifFalse:
					[(attribute key isLike: 'id') ifTrue: [att_id := attribute value]]].
	(att_type isNil or: [att_id isNil])
		ifTrue:
			[self errorHandler
				fatalError:
					(InvalidSignal new
						messageText:
							#requiredAttributesNotPresent << #xml >>
									'vue tag must have attributes called type and id')].
	currentView := Dictionary new.
	currentView at: #type put: att_type.
	views at: att_id put: currentView
]

{ #category : #'private-sax' }
XMLModel >> startElementVueref: someAttributes [
	
	someAttributes
		do:
			[:attribute | 
			(attribute key isLike: 'ref')
				ifTrue:
					[| vuerefs |
					vuerefs := currentView
						at: #vuerefs
						ifAbsentPut: [List new].
					vuerefs add: attribute value.
					^self]].
	self errorHandler
		fatalError:
			(InvalidSignal new
				messageText:
					#requiredAttributesNotPresent << #xml >>
							'vueref tag must have an attribute called ref')
]

{ #category : #simulation }
XMLModel >> startStep [
	"Handle the beginning of the step"
	
	playbackLogStream isNil ifFalse: [self startStepPlaybackLog]
]

{ #category : #'playback-log' }
XMLModel >> startStepPlaybackLog [
	"Handle the beginning of the step for the log"
	
	playbackLogStream
		nextPutAll: '<step>';
		cr
]

{ #category : #'initialize-release' }
XMLModel >> with: aModel on: aFilePath [
	"Initialize an instance with a model and a file path"
	"set the model and the path"
	
	model := aModel.
	filepath := aFilePath asFilename.	"Initialize other variables"
	attributes := List new.
	views := Dictionary new.
	agents := Dictionary new.	"does the file exist?"
	filepath exists
		ifFalse: [self generateSkeletonXMLFile]
		ifTrue:
			[self parseXMLFile.
			self checkWithModel]
]

{ #category : #'playback-log' }
XMLModel >> writeLeaveToPlaybackLogOf: anAgent from: aCell [
	"Write to playback log that an agent left"
	
	| agentID agentClass |
	agentID := anAgent id printString.
	agentClass := anAgent class name.
	playbackLogStream
		nextPutAll: '<laps>';
		cr;
		nextPutAll:
				'<supprAgent id="' , agentID , '" classe="' , agentClass , '" idCase="'
						, aCell id printString , '"/>';
		cr;
		nextPutAll: '</laps>';
		cr
]

{ #category : #'playback-log' }
XMLModel >> writeMapToPlaybackLog [
	"Output the current map on the playback log"
	
	playbackLogStream
		nextPutAll: '<map>';
		cr.
	model spaceModel elementaryEntities
		do:
			[:cell | 
			playbackLogStream
				nextPutAll: '<case>';
				cr.
			attributes
				do:
					[:att | 
					| type value |
					value := cell perform: (att at: #name) asSymbol.
					type := att at: #type.
					type = 'boolean'
						ifTrue:
							[value = true
								ifTrue:
									[playbackLogStream
										nextPutAll: '<true/>';
										cr]
								ifFalse:
									[playbackLogStream
										nextPutAll: '<false/>';
										cr]]
						ifFalse:
							[type = 'number'
								ifTrue:
									[value isNil
										ifTrue:
											[playbackLogStream
												nextPutAll: '<int>-1</int>';
												cr]
										ifFalse:
											[playbackLogStream
												nextPutAll: '<int>' , value printString , '</int>';
												cr]]
								ifFalse:
									["Not really subclass responsibility, but we need to extend this class here because
						the type encountered isn't either boolean or number"
									self subclassResponsibility]]].
			playbackLogStream
				nextPutAll: '</case>';
				cr].
	playbackLogStream
		nextPutAll: '</map>';
		cr
]

{ #category : #'playback-log' }
XMLModel >> writeMoveToPlaybackLogOf: anAgent from: srcCell to: dstCell [
	"Write to playback log that an agent moved"
	
	| agentID agentClass |
	agentID := anAgent id printString.
	agentClass := anAgent class name.
	playbackLogStream
		nextPutAll: '<laps>';
		cr.
	srcCell isNil
		ifTrue:
			[playbackLogStream
				nextPutAll:
						'<ajoutAgent id="' , agentID , '" classe="' , agentClass , '" idCase="'
								, dstCell id printString , '"/>';
				cr]
		ifFalse:
			[playbackLogStream
				nextPutAll:
						'<deplacerAgent id="' , agentID , '" classe="' , agentClass , '" from="'
								, srcCell id printString , '" to="' , dstCell id printString ,
									'"/>';
				cr].
	playbackLogStream
		nextPutAll: '</laps>';
		cr
]
