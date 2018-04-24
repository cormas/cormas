tests
testSinMinMaxPhasePeriod
	"Not nice but ... work :-) I need to fin the way in R to build a true test"
	self assert: (Cormas sin: 3 min: -10 max: 20 phase: 0 period: 24) equals: 25.606601717798213 