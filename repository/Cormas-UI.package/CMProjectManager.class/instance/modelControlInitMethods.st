accessing
modelControlInitMethods
	" Answer a <Collection> of <String> with CORMAS model control selectors "
	
	^ (self cormasModelClass organization listAtCategoryNamed: #control) collect: #asString