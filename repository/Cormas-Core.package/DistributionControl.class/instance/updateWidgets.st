changing
updateWidgets
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