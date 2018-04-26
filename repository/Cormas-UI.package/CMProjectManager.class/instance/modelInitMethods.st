accessing
modelInitMethods
	" Answer a <Collection> of <String> with CORMAS model initialization selectors "
	
	^ (self cormasModelClass organization listAtCategoryNamed: #init) collect: #asString