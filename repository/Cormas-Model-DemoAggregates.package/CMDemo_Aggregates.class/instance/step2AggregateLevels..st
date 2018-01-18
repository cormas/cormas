control
step2AggregateLevels: t
	"the 1st FragmentedForest will swell"
	self ask:
			(Cormas elementsFrom: self theFragmentedForests withMinValue: #minSurface)
		toDo: #swell