private
disableComServerExamples
	
	| exampleClassNames |
	exampleClassNames := #(COMDualInterfaceObject SmalltalkCommanderCOMObject AllDataTypesCOMObject AutomationAllDataTypes AutomationOnlySmalltalkCommander).
	exampleClassNames
		do:
			[:bnd | 
			bnd
				ifDefinedDo:
					[:b | 
					b
						unregister;
						removeSessionEventHandlers]]