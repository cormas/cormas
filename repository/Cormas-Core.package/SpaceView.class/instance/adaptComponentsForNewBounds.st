adapting
adaptComponentsForNewBounds
	
	| scaleFactor |
	scaleFactor := self preferredBounds extent / self oldBounds extent.	"- (1@0)"	"scaleFactor := self bounds extent / oldBounds extent."	"scaleFactor := self bounds extent / container bounds extent."
	self components
		do: [:aFigure | aFigure scaleByWithConstraints: scaleFactor].	"When the grid size has changed, the BitmapFigure have to be placed at the right place"
	((self components
		select:
			[:aFigure | (aFigure isKindOf: BitmapFigure) or: [aFigure isDistortable not]])
		collect: [:fig | fig entityType])
		do:
			[:aClass | 
			self
				changePov: (self model povMethodDico at: aClass name)
				ofEntity: aClass].	"	(((self components select: [:aFigure | aFigure isBitmapFigure]) 
		collect: [:fig | fig entityType]) asSet) do: 
				[:aClass | 
				self changePov: (self model povMethodDico at: aClass name) ofEntity: aClass]."
	Dev todo:
			'C''est incroyable √ßa (le change pov au dessus). il doit y a voir un moyen de replacer le bitmap figure au bonne endroit sans etre oblig√© de les reconstruire.'	"	self invalidateNow.
	(Dialog confirm: 'Fit Window to the SpaceModel?') ifTrue:[self model resizeWindow]"