model observation
defineCommunicationObs
	
	| messageClass items |
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].
	messageClass := Msg allSubclasses
		select: [:aClass | aClass category = self cormasModelClass category].
	messageClass isEmpty
		ifTrue: [^self alert_NewMessage]
		ifFalse:
			[messageClass size = 1
				ifTrue: [messageClass := messageClass first]
				ifFalse:
					[items := messageClass collect: [:a | a name asString].
					messageClass := Dialog choose: 'On which class?' labels: items values:
							messageClass default: nil].	"(Tools.FullNotebookSystemBrowser new) initializeForSystem; spawnOnClassHierarchy: messageClass."
			messageClass
				compile:
					('povMessage' ,
							'\"return a boolean"\^#true\"in that example all messages will be dispalyed"')
						withCRs
				classified: 'pov'.
			self
				withBrowserDo:
					[:b | 
					(b navigator)
						selectClass: messageClass;
						beHierarchy;
						setSelector: #povMessage	"browser := CormasRB open.
				browser setClasseMsgTo: messageClass"]]