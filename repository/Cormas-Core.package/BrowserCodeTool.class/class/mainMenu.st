resources
mainMenu
	"Tools.MenuEditor new openOnClass: self andSelector: #mainMenu"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #_Accept 
			#defaultString: '&Accept' 
			#catalogID: #browser) 
		#nameKey: #Accept 
		#value: #action: 
		#shortcutKeyCharacter: $S 
		#shortcutModifiers: 2) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #F_ormat 
			#defaultString: 'F&ormat' 
			#catalogID: #browser) 
		#nameKey: #'Format Code' 
		#value: #action: 
		#shortcutKeyCharacter: $O 
		#shortcutModifiers: 2) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #GoToClass 
			#defaultString: 'Go to Class' 
			#catalogID: #browser) 
		#nameKey: #'Navigate to Class' 
		#value: #action: 
		#enablementSelector: #hasClassSelected) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #BrowseClassInNewWindow 
			#defaultString: 'Browse Class in New Window' 
			#catalogID: #browser) 
		#nameKey: #'Open Browser on Class' 
		#value: #action: 
		#enablementSelector: #hasClassSelected 
		#shortcutKeyCharacter: #F12 
		#shortcutModifiers: 2) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #BrowseReferencesToClass 
			#defaultString: 'Browse References to Class' 
			#catalogID: #browser) 
		#nameKey: #'Browse References to Class' 
		#value: #action: 
		#enablementSelector: #hasClassSelected 
		#shortcutKeyCharacter: #F11 
		#shortcutModifiers: 2) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #BrowseVariableRe_ferencesDots 
			#defaultString: 'Browse Variable Re&ferences...' 
			#catalogID: #browser) 
		#nameKey: #'Selected Global Instance Variable References' 
		#value: #action: 
		#enablementSelector: #hasInstanceVariableSelected 
		#shortcutKeyCharacter: #F11 
		#shortcutModifiers: 2) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #BrowseVariableRea_dersDots 
			#defaultString: 'Browse Variable Rea&ders...' 
			#catalogID: #browser) 
		#nameKey: #'Selected Global Instance Variable Readers' 
		#value: #action: 
		#enablementSelector: #hasInstanceVariableSelected) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #BrowseVariable_WritersDots 
			#defaultString: 'Browse Variable &Writers...' 
			#catalogID: #browser) 
		#nameKey: #'Selected Global Instance Variable Writers' 
		#value: #action: 
		#enablementSelector: #hasInstanceVariableSelected) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #Browse_SendersOfSelector 
			#defaultString: 'Browse &Senders of Selector' 
			#catalogID: #browser) 
		#nameKey: #'Selected Message References' 
		#value: #action: 
		#enablementSelector: #hasMessageNodeSelected 
		#shortcutKeyCharacter: #F11 
		#shortcutModifiers: 2) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #Browse_ImplementorsOfSelector 
			#defaultString: 'Browse &Implementors of Selector' 
			#catalogID: #browser) 
		#nameKey: #'Selected Message Implementors' 
		#value: #action: 
		#enablementSelector: #hasMessageNodeSelected 
		#shortcutKeyCharacter: #F12 
		#shortcutModifiers: 2) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #Refactor 
			#defaultString: 'Refactor' 
			#catalogID: #browser) 
		#nameKey: #refactorMenu 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #_ExtractValueToTemporary 
				#defaultString: '&Extract Value to Temporary' 
				#catalogID: #browser) 
			#nameKey: #'Extract to Temporary' 
			#value: #action: 
			#enablementSelector: #hasValueNodeSelected) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #Re_nameVariableAsDots 
				#defaultString: 'Re&name Variable As...' 
				#catalogID: #browser) 
			#nameKey: #'Rename Selected Temporary Variable' 
			#value: #action: 
			#enablementSelector: #hasTemporaryVariableSelected 
			#shortcutKeyCharacter: $N 
			#shortcutModifiers: 3) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #MoveToInner_Scope 
				#defaultString: 'Move to Inner &Scope' 
				#catalogID: #browser) 
			#nameKey: #'Move Selected Temporary to Innermost Scope' 
			#value: #action: 
			#enablementSelector: #hasTemporaryVariableSelected) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #Con_vertToInstanceVariable 
				#defaultString: 'Con&vert to Instance Variable' 
				#catalogID: #browser) 
			#nameKey: #'Convert Temporary Variable to Instance Variable' 
			#value: #action: 
			#enablementSelector: #hasTemporaryVariableSelected) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #_RemoveParameter 
				#defaultString: '&Remove Parameter' 
				#catalogID: #browser) 
			#nameKey: #'Remove Selected Parameter' 
			#value: #action: 
			#enablementSelector: #hasTemporaryVariableSelected) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #In_lineParameter 
				#defaultString: 'In&line Parameter' 
				#catalogID: #browser) 
			#nameKey: #'Inline Selected Parameter' 
			#value: #action: 
			#enablementSelector: #hasTemporaryVariableSelected) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #In_lineMethod 
				#defaultString: 'In&line Method' 
				#catalogID: #browser) 
			#nameKey: #'Inline Method' 
			#value: #action: 
			#enablementSelector: #hasMessageNodeSelected) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #_ExtractToTemporary 
				#defaultString: '&Extract to Temporary' 
				#catalogID: #browser) 
			#nameKey: #'Extract to Temporary' 
			#value: #action: 
			#enablementSelector: #hasMessageNodeSelected) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #_InlineAssignedTemporary 
				#defaultString: '&Inline Assigned Temporary' 
				#catalogID: #browser) 
			#nameKey: #'Inline Temporary' 
			#value: #action: 
			#enablementSelector: #hasAssignmentSelected) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #PushVariable_Up 
				#defaultString: 'Push Variable &Up' 
				#catalogID: #browser) 
			#nameKey: #'Push Up Selected Instance Variable' 
			#value: #action: 
			#enablementSelector: #hasInstanceVariableSelected) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #CreateAccessors 
				#defaultString: 'Create Accessors' 
				#catalogID: #browser) 
			#nameKey: #'Create Selected Instance Variable Accessors' 
			#value: #action: 
			#enablementSelector: #hasInstanceVariableSelected) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #MakeVariableA_bstract 
				#defaultString: 'Make Variable A&bstract' 
				#catalogID: #browser) 
			#nameKey: #'Abstract Selected Instance Variable' 
			#value: #action: 
			#enablementSelector: #hasInstanceVariableSelected) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #_ProtectVariable 
				#defaultString: '&Protect Variable' 
				#catalogID: #browser) 
			#nameKey: #'Protect Selected Instance Variable' 
			#value: #action: 
			#enablementSelector: #hasInstanceVariableSelected) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #_ExtractMethod 
				#defaultString: '&Extract Method' 
				#catalogID: #browser) 
			#nameKey: #'Extract Method' 
			#value: #action: 
			#labelImage: #(ResourceRetriever BrowserIcons #extractMethod)) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #ExtractMethodToComponent 
				#defaultString: 'Extract Method to Component' 
				#catalogID: #browser) 
			#nameKey: #'Extract Method to Component' 
			#value: #action:)) #(13 2) nil)) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #_DoIt 
			#defaultString: '&Do it' 
			#catalogID: #browser) 
		#nameKey: #'Do It' 
		#value: #action: 
		#shortcutKeyCharacter: $d 
		#shortcutModifiers: 2 
		#labelImage: #(ResourceRetriever GeneralIcons #doIt)) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #Pri_ntIt 
			#defaultString: 'Pri&nt it' 
			#catalogID: #browser) 
		#nameKey: #'Print It' 
		#value: #action: 
		#shortcutKeyCharacter: $p 
		#shortcutModifiers: 2 
		#labelImage: #(ResourceRetriever GeneralIcons #printIt)) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #_InspectIt 
			#defaultString: '&Inspect it' 
			#catalogID: #browser) 
		#nameKey: #'Inspect It' 
		#value: #action: 
		#shortcutKeyCharacter: $q 
		#shortcutModifiers: 2 
		#labelImage: #(ResourceRetriever GeneralIcons #inspectIt)) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #_DebugIt 
			#defaultString: '&Debug it' 
			#catalogID: #browser) 
		#nameKey: #'Debug It' 
		#value: #action: 
		#shortcutKeyCharacter: $B 
		#shortcutModifiers: 2 
		#labelImage: #(ResourceRetriever GeneralIcons #debugIt)) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #Explain 
			#defaultString: 'Explain' 
			#catalogID: #browser) 
		#nameKey: #'Explain Code' 
		#value: #action: 
		#shortcutKeyCharacter: $E 
		#shortcutModifiers: 2) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #Cu_t 
			#defaultString: 'Cu&t' 
			#catalogID: #browser) 
		#nameKey: #'Cut Selection' 
		#value: #action: 
		#shortcutKeyCharacter: $X 
		#shortcutModifiers: 2 
		#labelImage: #(ResourceRetriever GeneralIcons #editCut)) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #_Copy 
			#defaultString: '&Copy' 
			#catalogID: #browser) 
		#nameKey: #'Copy Selection' 
		#value: #action: 
		#shortcutKeyCharacter: $C 
		#shortcutModifiers: 2 
		#labelImage: #(ResourceRetriever GeneralIcons #editCopy)) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #_Paste 
			#defaultString: '&Paste' 
			#catalogID: #browser) 
		#nameKey: #'Paste Selection' 
		#value: #action: 
		#shortcutKeyCharacter: $V 
		#shortcutModifiers: 2 
		#labelImage: #(ResourceRetriever GeneralIcons #editPaste)) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #_FindDots 
			#defaultString: '&Find...' 
			#catalogID: #browser) 
		#nameKey: #'Find Text' 
		#value: #action: 
		#shortcutKeyCharacter: $F 
		#shortcutModifiers: 2) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #_ReplaceDots 
			#defaultString: '&Replace...' 
			#catalogID: #browser) 
		#nameKey: #'Replace Text' 
		#value: #action: 
		#shortcutKeyCharacter: $R 
		#shortcutModifiers: 2) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #Cancel 
			#defaultString: 'Cancel' 
			#catalogID: #browser) 
		#nameKey: #Cancel 
		#value: #action:)) #(2 9 4 1 3 2 1) nil) decodeAsLiteralArray