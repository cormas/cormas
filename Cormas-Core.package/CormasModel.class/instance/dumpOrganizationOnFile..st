- binary storage
dumpOrganizationOnFile: aBosFilename
	"Purpose: [Backward] Register the complete organization into aBosFilename.
	aBosFilename = <Filename> as for instance: a NTFSFilename('c:\vw7.6nc\cormas\Models\ECEC\dump\step_0.bos')."
	
	| bos list |
	"name := Dialog request: 'Save the whole organization on File ' initialAnswer: 'filename.bos'."
	"register the classVar of all entities"
	self storeAllClassVarBOSS.	"finally, save the boss file"
	bos := BinaryObjectStorage onNew: aBosFilename writeStream.
	bos expectCycles: false.	"[bos nextPut: self] ensure: [bos close]."
	list := List
		with: self
		with: self spaceModel.
	[bos nextPutAll: list] ensure: [bos close].	"Forget the classVar of entities"
	self allClassVarBOSS: nil