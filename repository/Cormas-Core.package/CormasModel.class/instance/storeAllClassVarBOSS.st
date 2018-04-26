- binary storage
storeAllClassVarBOSS
	"store the classVar names and values into temporary attribute !allClassVarBOSS) in order to save them in a BOSS file"
	"Explications : 
| coll bos |
'First create a file containing a class' .
self class timeStep: 0.
coll := OrderedCollection new. 
coll add: self class.
bos := BinaryObjectStorage onNew: 'xxx.bos' asFilename writeStream. [bos nextPutAll: coll]
ensure: [bos close].

self class timeStep: 33.

'Read the file contents'. 
| bos array |
	bos := BinaryObjectStorage onOldNoScan: 'xxx.bos' asFilename readStream. [array := bos contents]
	ensure: [bos close].
^array first timeStep
"
	
	| classes |
	classes := self class allTerminalClasses.
	classes addFirst: self class.
	classes
		do:
			[:aClass | 
			self allClassVarBOSS
				at: aClass
				put: (self getClassVarOf: aClass)]