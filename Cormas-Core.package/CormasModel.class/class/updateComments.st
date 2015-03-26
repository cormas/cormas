description
updateComments
	"Add some comments to the new Model version by editing a Comment board and add the strings into the #versionComments method. Example:
versionComments
	^ 'old comments
------- 2011/1/7 - 11:58:34 ------- 
new comments.

	Ex: CormasNS.Models.ECEC.ECEC  updateComments "
	
	| commentInterface developerName firstLine |
	"open comments window"
	commentInterface := CommentInterface new.
	commentInterface previousComments value: self versionComments.
	firstLine := ' --------------------- ' , self version ,
			' --------------------- Date: ' , Cormas versionAsString , '\' withCRs.
	commentInterface newComments value: firstLine.
	self currentDeveloperName isEmpty
		ifTrue:
			[self authors isEmpty
				ifTrue: [developerName := '' asValue]
				ifFalse:
					[developerName := (Cormas textAsList: self authors) first asValue]]
		ifFalse: [developerName := self currentDeveloperName asValue].
	commentInterface authorName: developerName.
	commentInterface openInterface: #commentsModelWindow.
	commentInterface cancel value ifTrue: [^nil].	"update the #versionComments method"
	self
		setDescriptionFor: 'versionComments'
		withText:
			(self versionComments , '\' withCRs , '\'
				, commentInterface newComments value , '\ *** Developer: '
				, commentInterface authorName value , ' ***') withCRs.	"update the #currentDeveloperName method"
	self currentDeveloperName = commentInterface authorName value
		ifFalse:
			[self
				setDescriptionFor: 'currentDeveloperName'
				withText: commentInterface authorName value].	"	((Cormas textAsList: self authors) includes: self currentDeveloperName) ifFalse:[self setDescriptionFor: 'developerNames' withText: self developerNames , '\' withCRs , commentInterface authorName value]."
	^commentInterface