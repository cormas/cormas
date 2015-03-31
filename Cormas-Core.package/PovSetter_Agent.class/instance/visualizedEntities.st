menu-symbol
visualizedEntities
	
	| ve |
	ve := self cormas currentModel visualizableClasses.
	ve removeAll: self cormas currentModel spatialClasses.
	ve removeAllSuchThat: [:c | c inheritsFrom: ArcEntity].
	^ve