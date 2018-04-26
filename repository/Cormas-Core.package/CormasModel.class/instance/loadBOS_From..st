+ utilities - binary storage
loadBOS_From: aFileName
	"Purpose: Read the file contents and create the entities. The file is stored into the 'dump' directory of the model. aFileName is supposed to store the entities of same type.
	Arguments:  aFileName = <String>
	Example: self loadBOS_From: 'farmer.bos' "
	
	| bos array fileName classes |
	fileName := (Cormas dumpPath: self class name) construct: aFileName.
	fileName exists
		ifFalse:
			[^self cormas
				warn: '<1s> does not exist !  Loading entities canceled'
				with: fileName asString].
	bos := BinaryObjectStorage onOldNoScan: fileName readStream.
	[array := bos contents] ensure: [bos close].
	classes := OrderedCollection new.
	array do: [:inst | classes add: inst class].
	classes
		do:
			[:cl | 
			self removeOldEntities: cl.
			self installNewEntities: (array select: [:i | i class = cl])]