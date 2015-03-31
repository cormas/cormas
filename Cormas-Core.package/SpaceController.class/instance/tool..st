initialize-release
tool: aValueModel
	
	tool := aValueModel.
	tool onChangeSend: #changedTool to: self.
	self changedTool