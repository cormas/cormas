+ utilities - binary storage
saveBOS: aCollection into: aFileName
	"Purpose: Save the entities of aCollection into a BOS file. The file is stored into the 'dump' directory of the model.
	Arguments:  aCollection <Collection of Entities> ; aFileName = <String>
	Example: self saveBOS: self theFarmers into: '10x10.Farmer' "
	
	| bos fileName |
	fileName := (Cormas dumpPath: self class name) construct: aFileName.
	bos := BinaryObjectStorage onNew: fileName writeStream.
	bos expectCycles: false.
	[bos nextPutAll: aCollection] ensure: [bos close]