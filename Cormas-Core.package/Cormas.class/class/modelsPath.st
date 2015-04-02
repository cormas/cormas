paths
modelsPath
	"Returns a Filename corresponding to the path of 'Models' directory"
	
	| cheminModeles |
	cheminModeles := self cormasPath construct: 'Models'.
	cheminModeles asFilename exists
		ifFalse: [cheminModeles asFilename makeDirectory].
	^cheminModeles