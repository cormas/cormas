util
requestProbeNameInitialAnswer: defName
	
	| name |
	name := ''.
	[name isEmpty
		or:
			[(name contains: [:char | char canBePartOfSelector not])
				or: [name first canStartKeyword not]]]
		whileTrue:
			[name := Dialog request:
					'           Enter a name for that probe.
(space and symbol characters are not allowed)' initialAnswer: defName].
	^name