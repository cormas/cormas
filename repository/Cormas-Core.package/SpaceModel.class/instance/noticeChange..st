private - notification
noticeChange: aChange
	"notice a change reported from anEntity or SpaceModel, dispatch this change to all dependents"
	
	self dependents do:[:ob| ob update: #noticeChange with: aChange from: self]