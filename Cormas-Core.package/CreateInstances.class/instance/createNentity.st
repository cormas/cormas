actions
createNentity
	"lors du click sur bouton Create"
	
	| nb args constrainedCells |
	nb := self numberEntitiesToCreate.
	nb
		ifNil:
			[(self locateCreatedEntities value = #no
				or:
					[self locateCreatedEntities value = #random
						or: [self locateCreatedEntities value = #constrained]])
				ifTrue:
					[^self cormas
						warn:
							(UserMessage defaultString: ' Please, define a number !  ' key:
									#defineNumber)]].
	(self entityClass isNil not and: [self isNbEntitiesToCreatePositive])
		ifFalse: [^nil].	"Storing the model state before modification"
	self linkedSpaceInterface isNil
		ifFalse: [self linkedSpaceInterface storeBeforeManipulation].	"On g√®re ici le cas de la cr√©ation d'instances non localis√© ou localis√© al√©atoirement"
	(initMethod value isNil or: [initMethod value = ''])
		ifTrue:
			[self locateCreatedEntities value = #no
				ifTrue:
					[cormasModel
						createN: nb
						entity: self entityClass].
			self locateCreatedEntities value = #random
				ifTrue:
					[(self entityClass inheritsFrom: AgentLocation)
						ifTrue:
							[cormasModel
								setRandomlyLocatedAgents: self entityClass
								n: nb].
					(self entityClass inheritsFrom: ObjectLocation)
						ifTrue:
							[cormasModel
								setRandomlyLocatedObjects: self entityClass
								n: nb]].
			self locateCreatedEntities value = #constrained
				ifTrue:
					[constrainedCells := self requestConstraintsOnPatches.
					(constrainedCells isNil or: [constrainedCells isEmpty]) ifTrue: [^nil].
					(self entityClass inheritsFrom: AgentLocation)
						ifTrue:
							[(cormasModel
								createN: nb
								entity: self entityClass)
								do: [:e | e moveTo: (Cormas selectRandomlyFrom: constrainedCells)]].
					(self entityClass inheritsFrom: ObjectLocation)
						ifTrue:
							[(cormasModel
								createN: nb
								entity: self entityClass)
								do:
									[:e | e isMovedTo: (Cormas selectRandomlyFrom: constrainedCells)]]]]
		ifFalse:
			[self locateCreatedEntities value = #no
				ifTrue:
					[(initMethod value includes: $:)
						ifFalse:
							[cormasModel
								createN: nb
								entity: self entityClass
								initMethod: initMethod value asSymbol]
						ifTrue:
							[args := Cormas askUserArgumentsForMethod: initMethod value.
							args ifNil: [^nil].
							cormasModel
								createN: nb
								entity: self entityClass
								initMethod: initMethod value asSymbol
								arguments: args]].
			self locateCreatedEntities value = #random
				ifTrue:
					[(initMethod value includes: $:)
						ifFalse:
							[(self entityClass inheritsFrom: AgentLocation)
								ifTrue:
									[cormasModel
										setRandomlyLocatedAgents: self entityClass
										n: nb
										initMethod: initMethod value asSymbol].
							(self entityClass inheritsFrom: ObjectLocation)
								ifTrue:
									[cormasModel
										setRandomlyLocatedObjects: self entityClass
										n: nb
										initMethod: initMethod value asSymbol]]
						ifTrue:
							[cormasModel
								setRandomlyLocatedAgents: self entityClass
								n: nb
								initMethod: initMethod value asSymbol
								arguments: (Cormas askUserArgumentsForMethod: initMethod value)]].
			self locateCreatedEntities value = #constrained
				ifTrue:
					[constrainedCells := self requestConstraintsOnPatches.
					(constrainedCells isNil or: [constrainedCells isEmpty]) ifTrue: [^nil].
					(initMethod value includes: $:)
						ifFalse:
							[(self entityClass inheritsFrom: AgentLocation)
								ifTrue:
									[(cormasModel
										createN: nb
										entity: self entityClass
										initMethod: initMethod value asSymbol)
										do:
											[:e | e moveTo: (Cormas selectRandomlyFrom: constrainedCells)]].
							(self entityClass inheritsFrom: ObjectLocation)
								ifTrue:
									[(cormasModel
										createN: nb
										entity: self entityClass
										initMethod: initMethod value asSymbol)
										do:
											[:e | e isMovedTo: (Cormas selectRandomlyFrom: constrainedCells)]]]
						ifTrue:
							[(self entityClass inheritsFrom: AgentLocation)
								ifTrue:
									[(cormasModel
										createN: nb
										entity: self entityClass
										initMethod: initMethod value asSymbol
										arguments: (Cormas askUserArgumentsForMethod: initMethod value))
										do:
											[:e | e moveTo: (Cormas selectRandomlyFrom: constrainedCells)]].
							(self entityClass inheritsFrom: ObjectLocation)
								ifTrue:
									[(cormasModel
										createN: nb
										entity: self entityClass
										initMethod: initMethod value asSymbol
										arguments: (Cormas askUserArgumentsForMethod: initMethod value))
										do:
											[:e | e isMovedTo: (Cormas selectRandomlyFrom: constrainedCells)]]]]].	"On g√®re ici le cas de la cr√©ation d'instances  localis√© manuellement"
	self locateCreatedEntities value = #manually
		ifTrue: [self startLocateManually].	"enfin on met √† jour les compteurs du nombre d''entit√©s"
	self updateNbOfEntities