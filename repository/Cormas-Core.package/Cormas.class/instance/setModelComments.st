version
setModelComments
	"Open a CommentInterface to fill information.
The comments are stored as class methods of the model class"
	
	| commentInterface authors |
	self cormasModelClass ifNil: [^self alert_NoModel].
	commentInterface := CommentInterface new initOn: self cormasModelClass.
	commentInterface openInterface: #commentsWindow.
	authors := commentInterface authorMailList listHolder value.
	self cormasModelClass
		setDescriptionFirstDate: commentInterface creationDate value
		authors: (authors collect: [:author | author name])
		emails: (authors collect: [:author | author email])
		comments: commentInterface modelComments value asString