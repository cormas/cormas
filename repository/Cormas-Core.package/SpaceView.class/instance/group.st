menu actions
group
	
	| figures newFigure |
	figures := selections copy.
	figures isEmpty ifTrue: [^self].
	self removeAll: figures.
	newFigure := CompositeEntityFigure new.
	newFigure addAll: figures.
	self
		add: newFigure;
		selection: newFigure