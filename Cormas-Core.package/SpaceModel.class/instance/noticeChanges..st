private - notification
noticeChanges: someChanges
	"notice some grouped changes"
	
	someChanges isEmpty ifTrue: [^nil].
	self myDependents update: #noticeChanges with: someChanges from: self.
	Dev todo:
			'g√©rer ici les coupures r√©seaux en faisant des v√©rifications au niveau de myDependents'