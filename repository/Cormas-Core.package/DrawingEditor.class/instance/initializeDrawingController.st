initialize-release
initializeDrawingController
	
	drawing controller
		tool:
			(BlockValue
				block: [:selection | selection value]
				arguments: (Array with: self toolbarButtons selectionHolder))