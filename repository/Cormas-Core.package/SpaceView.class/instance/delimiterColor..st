menu actions
delimiterColor: aColor
	"change the color of the delimiter"
	
	delimiterColor := aColor.
	self delimiter = 0 ifTrue: [^nil].
	(self figuresOfEntity: self model activeSpatialEntity)
		do: [:aFig | aFig lineColor: aColor]