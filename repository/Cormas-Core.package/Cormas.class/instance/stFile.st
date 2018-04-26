model saving&loading ST
stFile
	"export the model as ST file. The user can not choose the name of the file : it is 'self cormasModelClass name asString , '.st' ' "
	
	| fileName |
	fileName := (self class modelPath: self cormasModelClass name)
		construct: self cormasModelClass name asString , '.st'.
	self stFile: fileName