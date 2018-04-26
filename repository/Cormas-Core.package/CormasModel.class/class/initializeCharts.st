instance creation
initializeCharts

	self charts: OrderedCollection new.
	self charts addAll: ((self organization listAtCategoryNamed: #graphiques)
			asOrderedCollection
			select: [ :n | 
				n greaseString last ~= $: and: [ n size <= 4
					or: [ (n findString: 'Data' startingAt: n size - 4) = 0 ] ] ])