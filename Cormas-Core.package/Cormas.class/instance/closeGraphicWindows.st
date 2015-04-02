interface actions
closeGraphicWindows
	"Close all the opened graphic windows (space interfaces and charts)"
	
	self spaceModel closeGraphicWindows.	"self spaceInterfaces do:[: spaceWin | spaceWin closeRequest].
	self spaceInterfaces: nil."
	self obsWin notNil
		ifTrue:
			[self obsWin observateur actionQuitter.
			self obsWin: nil].
	self visualStateWin notNil
		ifTrue:
			[self visualStateWin close.
			self visualStateWin: nil].
	self defineCommWin notNil
		ifTrue:
			[self defineCommWin closeRequest.
			self defineCommWin: nil].
	self displayChartsWin notNil
		ifTrue:
			[self displayChartsWin do: [:win | win closeRequest].
			self displayChartsWin: nil]