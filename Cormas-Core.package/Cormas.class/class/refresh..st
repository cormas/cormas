+ user interface
refresh: aSpaceInterface
	"force the mainWindow of aSpaceInterface (spaceView) to refresh its display when the simulation runs in distributedmode.
Fixes problem of refreshing in distributed mode (without this instruction, the user needs to move his mouse over the spaceview for the display to refresh"
	
	aSpaceInterface mainWindow
		ifNotNil:
			[:w | current isDistributed ifTrue: [w displayPendingInvalidation]]