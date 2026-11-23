Extension { #name : 'CMXYSeries' }

{ #category : '*Cormas-UI-Roassal3' }
CMXYSeries >> place: someValues in: someCategories [

	^ someValues collect: [ :each |
		  Point x: (someCategories indexOf: each x) y: each y ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMXYSeries >> valuesIn: aDataTable [
	"My points: the value on x, which may be a category, at the number on y"

	^ (self valuesOf: x in: aDataTable)
		  with: (self numbersOf: y in: aDataTable)
		  collect: [ :xValue :yValue | Point x: xValue y: yValue ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMXYSeries >> xValuesOf: someValues [

	^ someValues collect: [ :each | each x ]
]
