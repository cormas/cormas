model saving&loading ST
exportModelWithChoice
	"export the model as ST file. The user can choose the file name and also the version of the model as a consequence"
	
	| fileName |
	fileName := self prepareSavingAs: '.st'.
	fileName ifNil: [^nil].
	self stFile: fileName