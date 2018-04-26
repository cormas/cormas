model saving&loading ST
loadSTModel
	"Load a Model as ST file"
	
	| choosenDirectoryModelName |
	choosenDirectoryModelName := self askForModel.
	choosenDirectoryModelName ifNil: [^nil].
	self loadSTModel: choosenDirectoryModelName