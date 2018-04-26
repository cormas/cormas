- default value
pallete

	^ pallete ifNil: [ pallete := RTMultiLinearColor new
		colors: (RTColorPalette sequential colors: 9 scheme: 'YlGnBu') ].