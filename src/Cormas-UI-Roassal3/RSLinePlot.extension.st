Extension { #name : 'RSLinePlot' }

{ #category : '*Cormas-UI-Roassal3' }
RSLinePlot >> shape [
	"RSTLine requires this message through explicitRequirement, which is deprecated in Pharo 13. Pharo keeps every deprecation it signals, and this one would keep the chart, the simulation window and the model in memory forever. Remove me once Roassal stops sending explicitRequirement"

	^ super shape
]
