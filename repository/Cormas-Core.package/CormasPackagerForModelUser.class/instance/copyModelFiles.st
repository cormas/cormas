private actions
copyModelFiles
	
	| target pcl pclFile pstFile targetModelPath modelDirectoryTarget |
	target := self packagingDirectory \ Cormas modelsPath tail.
	target ensureDirectory.
	targetModelPath := Cormas modelPath: self currentModel name.
	self
		recursiveCopy: targetModelPath
		to: target
		matching: [:fn | self shouldBeCopied: fn].
	modelDirectoryTarget := target construct: self currentModel name.
	pcl := (Parcel parcelsDefiningClass: self currentModel) any.
	pclFile := pcl parcelFilename asFilename.
	pclFile copyTo: modelDirectoryTarget \ pclFile tail.
	pstFile := self pstFileFrom: pclFile.
	pstFile copyTo: modelDirectoryTarget \ pstFile tail.
	self redirectSourceFileFor: pcl to: pstFile