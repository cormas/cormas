new
newFrom: aSetOfPovs
	
	| newFigure |
	newFigure := self new.
	newFigure addAll: (aSetOfPovs collect: [:pov | pov asFigure]).
	^newFigure