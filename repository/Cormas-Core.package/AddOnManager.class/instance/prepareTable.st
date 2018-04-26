instance creation
prepareTable
	"Detect all add-ons availble in the add-on diirectory and put them in the dataset"
	
	| dir tmp aList corruptedFiles |
	dir := Cormas addOnsPath asFilename.
	tmp := SortedCollection sortBlock: [:a :b | a asString < b asString].
	dir directoryContents do: [:each | tmp add: (dir construct: each)].
	tmp removeAllSuchThat: [:file | file isDirectory].
	corruptedFiles := Set new.
	(tmp select: [:f | f extension = '.pcl'])
		do:
			[:aPcl | 
			(tmp
				contains:
					[:aF | 
					aF tail
						=
							((aPcl tail
								copyFrom: 1
								to: aPcl tail size - 4) , '.pst')])
				ifFalse:
					[self cormas warn: '.pst file is missing for add-on ''' , aPcl tail , ''''.
					corruptedFiles add: aPcl]].
	tmp removeAll: corruptedFiles.
	tmp := tmp select: [:f | f extension = '.st' or: [f extension = '.pcl']].
	tmp isEmpty
		ifTrue:
			[self alert_NoAddOn.
			^nil].
	aList := List new.
	tmp do: [:aFile | aList add: (AddOnManager_ListItem newOnFile: aFile)].
	self addOns_List list: aList.
	self setDefaultAddOnsToLoad