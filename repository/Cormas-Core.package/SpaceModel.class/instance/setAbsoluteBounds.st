private - absoluteWorld
setAbsoluteBounds
	"the absolute default space is a square space of 50x50 pixels. It has been defined for a 10x10 cells space.
It is never display, only copied by the SpaceViews.
It can be modified (setAbsoluteBounds) when for exemple there is 3 lines and 10 column. Then, absoluteBounds = 3/10 * 50 @ 50 pixels"
	
	| absoluteWidth absoluteHeight |
	absoluteBounds := nil.
	absoluteWidth := self absoluteBounds width * self column.
	absoluteHeight := self absoluteBounds height * self line.
	self
		absoluteBounds:
			(Rectangle
				origin: 0 @ 0
				extent: absoluteWidth @ absoluteHeight)