util
convertSourceTo2002: name
	"on copie le fichier model.st en model2001.st"
	
	| contents upgradeDictionary index stream oldVersion answer |
	oldVersion := (Filename splitExtension: name) first , '2001.'
		, (Filename splitExtension: name) last.
	oldVersion asFilename exists
		ifTrue:
			[self
				warn:
					(UserMessage defaultString:
							'Conversion already performed ! Just import it !' key:
							#alreadyConverted).
			^nil].
	answer := Dialog
		requestFileName:
			(UserMessage defaultString: 'Your previous version will be renamed as : '
				key: #previousVersion)
		default: oldVersion
		version: #new.
	answer isEmpty ifTrue: [^nil].
	name asFilename copyTo: answer asFilename.
	stream := name asFilename readStream.	"On devine le format des lignes"
	stream lineEndAuto.
	contents := stream contents.
	upgradeDictionary := Dictionary new.	"a completer en fonction de tous les changements de noms de methodes et de classes"	"attention a ne pas oublier le blanc en fin de string du nouveau nom sous 2002"
	upgradeDictionary
		at: 'SpatialEntity_Element' put: 'SpatialEntityElement ';
		at: 'SpatialEntity_Aggregate' put: 'SpatialEntityAggregate ';
		at: 'SpatialEntity_Partition' put: 'SpatialEntityAggregate ';
		at: 'SpatialEntity_Set_notConnex' put: 'SpatialEntityNotConnex ';
		at: 'SpatialEntity_CA' put: 'SpatialEntityCell ';
		at: 'initCharts!' put: 'initData! ';
		at: 'initLocalCharts' put: 'initData ';
		at: 'initGlobalCharts' put: 'initData ';
		at: 'updateCharts:' put: 'updateData: ';
		at: 'updateLocalCharts:' put: 'updateData: ';
		at: 'updateGlobalCharts:' put: 'updateData: ';
		at: 'Cormas_Model' put: 'CormasModel '.
	upgradeDictionary
		keysAndValuesDo:
			[:k :v | 
			index := contents findString: k startingAt: 1.
			[index ~= 0]
				whileTrue:
					[contents := contents
						changeFrom: index
						to: index + k size
						with: v.
					index := contents findString: k startingAt: index]].
	stream := name asFilename writeStream.
	stream nextPutAll: contents.
	stream close