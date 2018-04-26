methods
removeColor
	
	| aFig |
	aFig := self linkedSI drawing components
		detect: [:fig | fig model entityReference = object]
		ifNone: [nil].
	aFig
		ifNotNil:
			[(self entityClass inheritsFrom: CMSpatialEntity)
				ifTrue: [aFig fillColor: aFig model color]
				ifFalse:
					[aFig class ~= BitmapFigure
						ifTrue:
							[aFig fillColor: aFig model color	"(object povAt: aFig pov) color"]]]