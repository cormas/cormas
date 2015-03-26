actions
openSpaceInterface
	
	| si |
	self currentSimulation spaceModel
		ifNil: [^Dialog warn: 'The server does not have a spaceModel yet'].
	si := self clientSpaceModel openSpaceInterface.
	self habitusNames selections size = 1
		ifTrue:
			[si loadSilentltySIConfigName: self habitusNames selections first]