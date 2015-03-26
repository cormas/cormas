+ utilities - binary storage
loadBOS: aClass from: aFileName
	"Purpose: Read the file contents and create the entities. The file is stored into the 'dump' directory of the model.
	Arguments:  aFileName = <String>

 1. remove previous entities
 2. create the stored entities
 3. Then instal them in Cormas"
	
	| bos array fileName |
	fileName := (Cormas dumpPath: self class name)
		construct:
			(self
				getFileOf: aClass name
				from: aFileName).
	fileName exists
		ifFalse:
			[^self cormas
				warn: '<1s> does not exist !  Loading entities canceled'
				with: fileName asString].	"remove previous entities"
	self removeOldEntities: aClass.	"create the stored entities"
	bos := BinaryObjectStorage onOldNoScan: fileName readStream.
	[array := bos contents] ensure: [bos close].	"Then instal them in Cormas"
	self installNewEntities: array