utilities - random
setRandomlyLocatedAgents: ag n: nbAg initMethod: maMeth arguments: arg


	| t5 |
	(t5 := self
				createN: nbAg
				entity: ag
				initMethod: maMeth
				arguments: arg) do: [:t6 | t6 moveTo: self randomCell].
	^t5