private
keepClass: aClass into: keptItems
	"keep aClass and its methods"
	
	| instSide classSide |
	instSide := aClass instanceBehavior.
	classSide := aClass classBehavior.
	keptItems keepClass: instSide.
	instSide selectors
		do: [:each | keptItems keepSelector: each inClass: instSide].
	classSide selectors
		do: [:each | keptItems keepSelector: each inClass: classSide]