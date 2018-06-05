accessing
modelProbesMethods
	" Answer a <Collection> of <String> with CORMAS model probes selectors "

	^ (self cormasModelClass organization listAtCategoryNamed: #probes) collect: [:aGlobalProbeName | 'Global>>', aGlobalProbeName asString]