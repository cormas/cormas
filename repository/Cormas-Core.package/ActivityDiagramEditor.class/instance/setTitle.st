title
setTitle
	
	| title |
	title := 'Activity Diagram Editor for Entity < ' , self targetClass name ,
			' > '.
	self name isEmpty
		ifFalse: [title := title , ' and method ' , self name printString].
	self builder window label: title