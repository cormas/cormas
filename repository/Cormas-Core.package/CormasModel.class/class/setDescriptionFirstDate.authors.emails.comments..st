description - primitives
setDescriptionFirstDate: firstDate authors: list1 emails: list2 comments: additionalText
	
	self setDescriptionFor: 'creationDate' withText: firstDate.
	self
		setDescriptionFor: 'authors'
		withText: (list1 fold: [:a :b | a , '\' , b]) withCRs.
	self
		setDescriptionFor: 'emails'
		withText: (list2 fold: [:a :b | a , '\' , b]) withCRs.
	self setDescriptionFor: 'comments' withText: additionalText.
	self addClassComment