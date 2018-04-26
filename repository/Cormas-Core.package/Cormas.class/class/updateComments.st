version
updateComments
	"Add some comments to the new Cormas version by editing a Comment board and add the strings into the #versionComments method. Example:
versionComments
	^ 'old comments
------- 2011/1/7 - 11:58:34 ------- 
new comments.

	Cormas  updateComments "
	
	| commentInterface |
	"open comments window"
	commentInterface := CommentInterface new.
	commentInterface
		cormasComments:
			(' --------------------- ' withCRs , self versionAsString ,
					' --------------------- 
') asValue.
	commentInterface authorName: self currentDeveloperName asValue.
	commentInterface openInterface: #commentsCormasWindow.	"update the #versionComments method"
	self
		setDescriptionFor: 'versionComments'
		withText:
			self versionComments , '\' withCRs , commentInterface cormasComments value
				, '\' withCRs , ' *** Developer: ' , commentInterface authorName value
				, ' ***' , '\' withCRs , ' *** kernel FileName: ' , self kernelFileName
				, ' ***' , '\' withCRs , ' *** VW compatibility: '
				, self vwCompatibleVersion printString , ' ***'.	"update the #currentDeveloperName method"
	self currentDeveloperName = commentInterface authorName value
		ifFalse:
			[self
				setDescriptionFor: 'currentDeveloperName'
				withText: commentInterface authorName value].
	((self textAsList: self developerNames)
		includes: self currentDeveloperName)
		ifFalse:
			[self
				setDescriptionFor: 'developerNames'
				withText:
					self developerNames , '\' withCRs , commentInterface authorName value].
	^commentInterface