initialization
setActionsForRb
	"  buttonNetworkNode buttonNetworkArc buttonFullNetwork buttonMessage "
	self rbTypeGroup buttonObject whenActivatedDo: [  ].
	self rbTypeGroup buttonObject whenDeactivatedDo: [  ].
	
	self rbTypeGroup buttonLocatedObject whenActivatedDo: [  ].
	self rbTypeGroup buttonLocatedObject whenDeactivatedDo: [  ].

