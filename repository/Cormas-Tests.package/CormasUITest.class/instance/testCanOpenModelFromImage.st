test
testCanOpenModelFromImage
	| p |
	p := CMProjectManager new.
	p openImageProject: #CMConwayModel.
	self assert: p currentProject cormasModel class name equals: #CMConwayModel