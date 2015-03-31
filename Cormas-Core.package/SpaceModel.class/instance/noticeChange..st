private - notification
noticeChange: aChange
	"notice a change reported from anEntity or SpaceModel, dispatch this change to all dependents"
	
	self myDependents update: #noticeChange with: aChange from: self