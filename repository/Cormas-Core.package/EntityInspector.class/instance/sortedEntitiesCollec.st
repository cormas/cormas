methods
sortedEntitiesCollec
	
	Dev todo:
			'method a revoir pour ledistribu√© car requiere enormement d''appels au serveur'.
	^self entitiesCollec sorted: [:x :y | x id < y id]