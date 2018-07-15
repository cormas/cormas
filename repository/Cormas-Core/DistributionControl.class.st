Class {
	#name : #DistributionControl,
	#superclass : #UIApplicationModel,
	#instVars : [
		'serverPort',
		'clients',
		'distributedMode',
		'serverNameOrIP',
		'broker',
		'habitusNames',
		'clientNameOrIP',
		'remoteDistribution',
		'remoteBroker',
		'client',
		'brokerPort',
		'brokerNameOrIP',
		'connected',
		'clientSpaceModel',
		'currentSimulation'
	],
	#category : 'Cormas-Core-Others'
}

{ #category : #utiles }
DistributionControl class >> defaultPort [
	"default broker port"
	
	^4242
]

{ #category : #utiles }
DistributionControl class >> defaultServerPort [
	
	^4242
]

{ #category : #utiles }
DistributionControl class >> getHostname [
	
	^SocketAccessor getHostname
]

{ #category : #'interface specs' }
DistributionControl class >> windowSpec [
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Distribution Control' 
			#bounds: #(Rectangle 800 450 1453 783)) 
		#component: #(SpecCollection 
			#collection: #(#(RadioButtonSpec 
				#layout: #(Point 17 54) 
				#name: #serverRadio 
				#flags: 32 
				#model: #distributedMode 
				#label: 'Server' 
				#select: #server) #(RadioButtonSpec 
				#layout: #(Point 109 54) 
				#name: #clientRadio 
				#flags: 32 
				#model: #distributedMode 
				#label: 'Client' 
				#select: #client) #(InputFieldSpec 
				#layout: #(Rectangle 114 15 214 38) 
				#name: #brokerNameOrIPField 
				#model: #brokerNameOrIP) #(InputFieldSpec 
				#layout: #(Rectangle 259 15 306 38) 
				#name: #brokerPortField 
				#model: #brokerPort) #(LabelSpec 
				#layout: #(Point 14 17) 
				#name: #Label1 
				#label: 'Local name or IP:') #(LabelSpec 
				#layout: #(Point 229 17) 
				#name: #Label2 
				#label: 'Port:') #(ActionButtonSpec 
				#layout: #(Rectangle 350 15 431 38) 
				#name: #toggleBrokerButton 
				#model: #toggleBroker 
				#label: 'Start' 
				#defaultable: true) #(SequenceViewSpec 
				#layout: #(Rectangle 182 150 507 310) 
				#name: #clientsList 
				#model: #clients 
				#useModifierKeys: true 
				#selectionType: #highlight) #(RegionSpec 
				#layout: #(Rectangle 319 16 341 38) 
				#name: #status 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #red)) 
				#lineWidth: 1 
				#regionType: #ellipse) #(SequenceViewSpec 
				#layout: #(Rectangle 16 150 171 310) 
				#name: #habitusNamesList 
				#flags: 45 
				#model: #habitusNames 
				#multipleSelections: true 
				#selectionType: #checkMark 
				#autoSelect: false) #(LabelSpec 
				#layout: #(Point 180 127) 
				#name: #clientsLabel 
				#label: 'Clients') #(LabelSpec 
				#layout: #(Point 22 127) 
				#name: #Label4 
				#label: 'Habitus') #(InputFieldSpec 
				#layout: #(Rectangle 115 89 215 112) 
				#name: #serverNameOrIPField 
				#flags: 40 
				#model: #serverNameOrIP) #(LabelSpec 
				#layout: #(Point 16 91) 
				#name: #serverNameOrIPLabel 
				#flags: 32 
				#label: 'Server name or IP:') #(ActionButtonSpec 
				#layout: #(Rectangle 568 4 649 27) 
				#name: #ActionButton1 
				#model: #inspect 
				#label: 'Inspect' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 546 89 627 112) 
				#name: #pingServerButton 
				#flags: 40 
				#model: #pingServer 
				#label: 'Ping' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 350 89 431 112) 
				#name: #connectButton 
				#flags: 40 
				#model: #toggleConnection 
				#label: 'Connect' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 546 212 627 235) 
				#name: #removeClientButton 
				#flags: 40 
				#model: #removeClient 
				#label: 'Remove' 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 232 91) 
				#name: #serverPortLabel 
				#flags: 32 
				#label: 'Port:') #(InputFieldSpec 
				#layout: #(Rectangle 262 89 309 112) 
				#name: #serverPortField 
				#flags: 40 
				#model: #serverPort) #(ActionButtonSpec 
				#layout: #(Rectangle 546 180 627 203) 
				#name: #pingClientButton 
				#flags: 40 
				#model: #pingClient 
				#label: 'Ping' 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 191 52) 
				#name: #helpModeLabel 
				#flags: 16 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #red)) 
				#label: '<- Choose a distribution mode') #(RegionSpec 
				#layout: #(Rectangle 518 89.5 540 111.5) 
				#name: #pingServerStatus 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 5734 5734 5734)) 
				#lineWidth: 1 
				#regionType: #ellipse) #(RegionSpec 
				#layout: #(Rectangle 518 180.5 540 202.5) 
				#name: #pingClientStatus 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 5734 5734 5734)) 
				#lineWidth: 1 
				#regionType: #ellipse) #(ActionButtonSpec 
				#layout: #(Rectangle 546 122 627 145) 
				#name: #openSpaceInterfaceButton 
				#model: #openSpaceInterface 
				#label: 'Open' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 568 31 649 54) 
				#name: #ActionButton2 
				#model: #inspectIpConfig 
				#label: 'Ip config' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 542 270 623 293) 
				#name: #checkAllClientsButton 
				#flags: 40 
				#model: #checkAllClients 
				#label: 'Check all clients' 
				#defaultable: true))))
]

{ #category : #accessing }
DistributionControl >> addClient: aClient [
	
	| aList |
	aList := self clients list.
	(aList includes: aClient) ifFalse: [aList add: aClient]
]

{ #category : #accessing }
DistributionControl >> broker [
	
	^broker
]

{ #category : #accessing }
DistributionControl >> brokerIP [
	
	^IPSocketAddress
		hostName: self brokerNameOrIP value
		port: self brokerPort value asNumber
]

{ #category : #aspects }
DistributionControl >> brokerNameOrIP [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^brokerNameOrIP isNil
		ifTrue: [brokerNameOrIP := String new asValue]
		ifFalse: [brokerNameOrIP]
]

{ #category : #aspects }
DistributionControl >> brokerPort [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^brokerPort isNil
		ifTrue: [brokerPort := String new asValue]
		ifFalse: [brokerPort]
]

{ #category : #actions }
DistributionControl >> brokerStarted [
	"true if the broker is actually started"
	
	^broker notNil and: [broker isRunning]
]

{ #category : #actions }
DistributionControl >> checkAllClients [
	
	| notResponding |
	notResponding := Set new.
	self clients list
		do:
			[:c | (self ping: c distributionControl) ifFalse: [notResponding add: c]].
	notResponding isEmpty
		ifFalse:
			[notResponding do: [:c | self removeClient: c].
			self spaceModel checkRemoteSpaceModels]
]

{ #category : #aspects }
DistributionControl >> clientNameOrIP [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^clientNameOrIP isNil
		ifTrue: [clientNameOrIP := String new asValue]
		ifFalse: [clientNameOrIP]
]

{ #category : #'private accessing' }
DistributionControl >> clientRemoteSimulation [
	
	^currentSimulation
		ifNil: [currentSimulation := remoteDistribution currentSimulation]
]

{ #category : #'private accessing' }
DistributionControl >> clientSpaceModel [
	"return a ClientSpaceModel on the remote spaceModel.
	you should not acccess direcly this method. Use spaceModel"
	
	^clientSpaceModel
		ifNil: [clientSpaceModel := ClientSpaceModel new on: self]
]

{ #category : #aspects }
DistributionControl >> clients [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^clients isNil
		ifTrue: [clients := SelectionInList new]
		ifFalse: [clients]
]

{ #category : #changing }
DistributionControl >> clientsSelectionChanged [
	
	self
		enable: #(#removeClientButton #pingClientButton)
		if: clients selectionIndex ~= 0.
	self
		updateStatus: #pingClientStatus
		toColor: ColorValue gray
		immediate: true
]

{ #category : #actions }
DistributionControl >> connect [
	
	| mode |
	self brokerStarted ifFalse: [^Dialog warn: 'No broker started'].
	mode := self distributedMode value.
	mode ifNil: [^Dialog warn: 'Choose a distributed mode (Server or Client)'].
	mode = #client ifTrue: [^self connectAsClient].
	mode = #server ifTrue: [^self connectAsServer].
	^self error: 'Internal problem : unknown mode'
]

{ #category : #actions }
DistributionControl >> connectAsClient [
	"act as a client. connect to the server"
	
	| ipServer ns |
	self brokerStarted ifFalse: [^Dialog warn: 'The broker is not started'].
	self isSameServerAndClient
		ifTrue:
			[^Dialog warn:
					'The server name and port cannot be both same as local. Change one of port or name.'].
	client := DistributedClient on: self.
	[ipServer := self serverIP.
	remoteBroker := broker activeBrokerAt: ipServer.
	ns := remoteBroker namingService.
	remoteDistribution := ns resolve: 'Cormas.distribution'.
	remoteDistribution addClient: client.
	self connected: true]
		on: Exception
		do:
			[:ex | 
			Dialog warn: 'Problem: ' , ex messageText.
			remoteBroker := remoteDistribution := nil]
]

{ #category : #actions }
DistributionControl >> connectAsServer [
	"share the simulation information"
	
	self connected: true
]

{ #category : #accessing }
DistributionControl >> connected [
	
	^connected ifNil: [connected := false]
]

{ #category : #accessing }
DistributionControl >> connected: aBoolean [
	
	connected := aBoolean.
	self connectionStatusChanged
]

{ #category : #changing }
DistributionControl >> connectionStatusChanged [
	
	self
		updateWidget: #connectButton
		label: ('<1?Disconnect:Connect>' expandMacrosWith: self connected).
	self
		updateStatus: #pingServerStatus
		toColor: (self statusColorFor: self connected)
		immediate: true.
	self updateWidgets
]

{ #category : #accessing }
DistributionControl >> currentSimulation [
	
	self distributedMode value == #client
		ifTrue: [^self clientRemoteSimulation].
	^Cormas current currentSimulation
]

{ #category : #actions }
DistributionControl >> disconnect [
	
	remoteDistribution
		ifNotNil:
			[:dist | 
			[dist removeClient: client]
				on: Exception
				do: [:ex | Dialog warn: 'The server is not responding']].
	remoteBroker := remoteDistribution := nil.
	self connected: false.
	clientSpaceModel changed: #closeRequest.
	currentSimulation := nil.
	clientSpaceModel := nil
]

{ #category : #aspects }
DistributionControl >> distributedMode [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^distributedMode isNil
		ifTrue: [distributedMode := nil asValue]
		ifFalse: [distributedMode]
]

{ #category : #changing }
DistributionControl >> distributedModeChange [
	
	self updateWidgets
]

{ #category : #utiles }
DistributionControl >> enable: widgetIDs if: aBoolean [
	"enable/disable one or many widgets. widgetsIDs can be aSymbol or an Array of Symbol"
	
	(Cormas arrayFrom: widgetIDs)
		do:
			[:each | (self wrapperAt: each) ifNotNil: [:w | w isEnabled: aBoolean]]
]

{ #category : #aspects }
DistributionControl >> habitusNames [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^habitusNames isNil
		ifTrue: [habitusNames := MultiSelectionInList new]
		ifFalse: [habitusNames]
]

{ #category : #'initialize-release' }
DistributionControl >> initialize [
	
	super initialize.
	self brokerNameOrIP value: self class getHostname.
	self brokerPort value: self class defaultPort printString.
	self serverNameOrIP value: self class getHostname.
	self serverPort value: self class defaultPort printString.
	self distributedMode onChangeSend: #distributedModeChange to: self.
	self clients selectionIndexHolder onChangeSend: #clientsSelectionChanged
		to: self.
	self updateHabitusNames
]

{ #category : #actions }
DistributionControl >> inspectIpConfig [
	
	| p response |
	p := WinProcess new.
	p encoding: #cp437.
	response := p fork: 'netsh' arguments: #('interface' 'ip' 'show' 'config').
	response inspect
]

{ #category : #actions }
DistributionControl >> isSameServerAndClient [
	"true if the broker specification and the client specification are same"
	
	^self brokerNameOrIP value = self serverNameOrIP value
		and: [self brokerPort value = self serverPort value]
]

{ #category : #actions }
DistributionControl >> openSpaceInterface [
	
	| si |
	self currentSimulation spaceModel
		ifNil: [^Dialog warn: 'The server does not have a spaceModel yet'].
	si := self clientSpaceModel openSpaceInterface.
	self habitusNames selections size = 1
		ifTrue:
			[si loadSilentltySIConfigName: self habitusNames selections first]
]

{ #category : #actions }
DistributionControl >> ping: anObject [
	
	^[anObject ping]
		on: Exception
		do: [:ex | false]
]

{ #category : #actions }
DistributionControl >> pingClient [
	
	self clients selection
		ifNotNil:
			[:c | 
			self
				updateStatus: #pingClientStatus
				toColor: (self statusColorFor: (self ping: c distributionControl))]
]

{ #category : #actions }
DistributionControl >> pingServer [
	
	| ok |
	self brokerStarted ifFalse: [^Dialog warn: 'A broker should be started'].
	self
		updateStatus: #pingServerStatus
		toColor: ColorValue gray
		immediate: true.
	ok := broker ping: self serverIP.
	self
		updateStatus: #pingServerStatus
		toColor: (self statusColorFor: ok)
		immediate: true
]

{ #category : #'interface opening' }
DistributionControl >> postBuildWith: aBuilder [
	
	super postBuildWith: aBuilder.
	self updateWidgets
]

{ #category : #actions }
DistributionControl >> removeClient [
	"remove the selected client"
	
	self clients selection ifNotNil: [:s | self removeClient: s]
]

{ #category : #accessing }
DistributionControl >> removeClient: aClient [
	
	self clients list
		remove: aClient
		ifAbsent: []
]

{ #category : #'interface opening' }
DistributionControl >> reopen [
	
	| w |
	w := self mainWindow.
	(w isNil or: [w isOpen not])
		ifTrue: [self open]
		ifFalse:
			[w raise.
			w expand]
]

{ #category : #'interface closing' }
DistributionControl >> requestForWindowClose [
	
	self brokerStarted
		ifTrue:
			[Dialog warn: 'Please, stop the broker before closing this windows'.
			^false].
	^true
]

{ #category : #accessing }
DistributionControl >> serverIP [
	
	^IPSocketAddress
		hostName: self serverNameOrIP value
		port: self serverPort value asNumber
]

{ #category : #aspects }
DistributionControl >> serverNameOrIP [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^serverNameOrIP isNil
		ifTrue: [serverNameOrIP := String new asValue]
		ifFalse: [serverNameOrIP]
]

{ #category : #aspects }
DistributionControl >> serverPort [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^serverPort isNil
		ifTrue: [serverPort := String new asValue]
		ifFalse: [serverPort]
]

{ #category : #accessing }
DistributionControl >> spaceModel [
	"return the current space model"
	
	self distributedMode value == #client ifTrue: [^self clientSpaceModel].
	^Cormas current currentSimulation spaceModel
]

{ #category : #actions }
DistributionControl >> startBroker [
	
	| ip |
	self brokerStarted
		ifTrue: [^self error: 'Internal problem : a broker is already started'].
	ip := self brokerIP.
	[broker := RequestBroker newStstTcpAt: ip.
	broker start.
	broker openSelectors: broker openSelectors , #(#namingService).
	(broker namingService)
		create: 'Cormas';
		rebind: 'Cormas.distribution' to: self.
	Transcript
		cr;
		print: broker.
	self updateWidgets]
		on: Exception
		do:
			[:ex | 
			Dialog warn: 'Problem: ' , ex messageText.
			broker := nil]
]

{ #category : #utiles }
DistributionControl >> statusColorFor: aBoolean [
	
	aBoolean ifNil: [^ColorValue gray].
	^aBoolean
		ifTrue: [ColorValue green]
		ifFalse: [ColorValue red]
]

{ #category : #actions }
DistributionControl >> stopBroker [
	
	self disconnect.
	broker
		ifNotNil:
			[broker stop.
			broker := nil].
	self updateWidgets
]

{ #category : #actions }
DistributionControl >> toggleBroker [
	
	self brokerStarted
		ifTrue: [self stopBroker]
		ifFalse: [self startBroker]
]

{ #category : #actions }
DistributionControl >> toggleConnection [
	
	self connected
		ifTrue: [self disconnect]
		ifFalse: [self connect]
]

{ #category : #'initialize-release' }
DistributionControl >> updateHabitusNames [
	"compute the habitus names (can be called at any time)"
	
	self habitusNames
		list: Cormas current currentSimulation habitusNames asList
]

{ #category : #utiles }
DistributionControl >> updateStatus: aWidgetID toColor: aColorValue [
	"update status region identified by widgetID with a green or red color. go to gray after a little time if aBoolean"
	
	self updateStatus: aWidgetID toColor: aColorValue immediate: false
]

{ #category : #utiles }
DistributionControl >> updateStatus: aWidgetID toColor: aColorValue immediate: aBoolean [
	"update status region identified by widgetID with a green or red color. Show a transition gray for visual effect if aBoolean"
	
	aBoolean
		ifFalse:
			[self
				updateStatus: aWidgetID
				toColor: ColorValue gray
				immediate: true.
			(Delay forSeconds: 0.2) wait].
	(self wrapperAt: aWidgetID)
		ifNotNil:
			[:w | 
			| look |
			look := w lookPreferences copy.
			look setBackgroundColor: aColorValue.
			w lookPreferences: look].
	ScheduledControllers checkForEvents
]

{ #category : #utiles }
DistributionControl >> updateWidget: widgetID label: newLabel [
	"update the string label of a widget"
	
	(self widgetAt: widgetID) ifNotNil: [:w | w labelString: newLabel]
]

{ #category : #changing }
DistributionControl >> updateWidgets [
	"update the widgets (essentially the toggleBrokerButton"
	
	| mode |
	mode := self distributedMode value.
	self
		updateWidget: #toggleBrokerButton
		label: ('<1?Start:Stop>' expandMacrosWith: self brokerStarted not).
	self
		updateStatus: #status
		toColor: (self statusColorFor: self brokerStarted)
		immediate: true.
	self
		enable: #(#serverRadio #clientRadio)
		if: (self brokerStarted and: [self connected not]).
	self
		enable:
			#(#serverNameOrIPField #serverNameOrIPLabel #serverPortField #serverPortLabel #habitusNamesList)
		if: (mode == #client and: [self connected not]).
	self
		enable: #(#brokerNameOrIPField #brokerPortField)
		if: self brokerStarted not.
	self
		enable: #(#connectButton #pingServerButton)
		if: (self brokerStarted and: [mode == #client]).
	self
		enable: #openSpaceInterfaceButton
		if: self connected.
	self
		visible: #helpModeLabel
		if: (self brokerStarted and: [mode isNil]).
	self
		visible:
			#(#clientsLabel #clientsList #pingClientButton #removeClientButton #pingClientStatus)
		if: mode == #server.
	self
		enable: #(#checkAllClientsButton)
		if: (mode == #server and: [self brokerStarted])
]

{ #category : #utiles }
DistributionControl >> visible: widgetIDs if: aBoolean [
	"set visible/invisible one or many widgets. widgetsIDs can be aSymbol or an Array of Symbol"
	
	(Cormas arrayFrom: widgetIDs)
		do:
			[:each | (self wrapperAt: each) ifNotNil: [:w | w isVisible: aBoolean]]
]
