model saving&loading
selectModelDirectory
	"Selection dans la liste des modeles importables"
	
	| modelDirectory tmp choosenDirectoryModelName |
	modelDirectory := self class modelsPath asFilename.
	tmp := SortedCollection sortBlock: [:a :b | a asString < b asString].
	modelDirectory directoryContents
		do: [:each | tmp add: (modelDirectory construct: each)].
	tmp removeAllSuchThat: [:file | file isDirectory not].
	tmp := tmp collect: [:f | f tail].
	tmp isEmpty
		ifTrue:
			[self alert_NoModel.
			^nil].
	choosenDirectoryModelName := Dialog
		choose: self chooseModel
		fromList: tmp asList
		values: tmp
		lines: 8
		cancel: [^nil].
	^choosenDirectoryModelName