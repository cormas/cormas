interface specs
windowSpec
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