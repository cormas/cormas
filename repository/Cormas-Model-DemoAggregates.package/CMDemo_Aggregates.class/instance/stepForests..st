control
stepForests: t 
"Each cell has a small probability of changing its state. Then each grove expands on external cells that are mostly surrounded by groves. Finally, the aggregates are rebuilt"
	self thePlots do: [:c | c newState].
	self theGroves do: [:a | a expand].
	self buildForests