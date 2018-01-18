testing
belongToAggregate
	^self theCSE notNil and: 
			[(self theCSE includesKey: #Aggregate)
				and: [(self theCSE at: #Aggregate) notNil]]