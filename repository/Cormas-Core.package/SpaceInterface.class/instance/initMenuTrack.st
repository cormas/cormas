menu-track
initMenuTrack
	"set the sub menu 'trackAgents'"
	
	| menuAgents menuDyn agentClasses |
	agentClasses := List new.
	agentClasses := self socialClassesForMenu: #track.
	menuDyn := self menuHolder value atNameKey: #trackAgents.
	menuAgents := Menu new.
	1
		to: agentClasses size
		do:
			[:i | 
			| aClass |
			aClass := agentClasses at: i.
			menuAgents
				addItemLabel: aClass name
				value: [self trackAgents: aClass]].
	menuDyn submenu: menuAgents