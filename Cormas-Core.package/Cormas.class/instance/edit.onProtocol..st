model entities
edit: aClass onProtocol: aSymbol
	"Cormas new edit: Agent.
Set the nagitor selection on a specified protocol"
	
	self
		withBrowserDo:
			[:b | 
			| navigator newState |
			navigator := b navigator.
			newState := navigator getState.
			newState
				protocol: aSymbol;
				selectors: #().
			navigator
				selectClass: aClass;
				beHierarchy;
				updatePartsWith: newState;
				changed]