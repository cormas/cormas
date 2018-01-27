actions
changedRandomSeed
	
	| wrapper |
	wrapper := self builder componentAt: #randomSeed.
	fixRandomSeed value
		ifTrue:
			[wrapper beVisible.
			wrapper enable.	"wrapper beInvisible."
			(self builder componentAt: #releaseRandomSeed) enable]
		ifFalse:
			[wrapper disable.
			(self builder componentAt: #releaseRandomSeed) disable.
			releaseRandomSeed value: false]