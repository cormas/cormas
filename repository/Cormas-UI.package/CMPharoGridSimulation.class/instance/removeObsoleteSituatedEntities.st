model scheduling
removeObsoleteSituatedEntities
	| obsoleteSituatedEntities |
	obsoleteSituatedEntities  := situatedEntitiesViews select: [ :e | e model isSituated not ].
	obsoleteSituatedEntities do:[:e| e remove].
	situatedEntitiesViews removeAll: obsoleteSituatedEntities.