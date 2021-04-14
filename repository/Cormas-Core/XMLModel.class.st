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
