accessing-Figures
celluleFigures
	
	^self components
		select: [:fig | fig entityType = self model cormasModelClass cellClass]