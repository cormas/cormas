actions
writeActivityDefinitionsOn: codeStream
	
	states do: [:each | each writeDefinitionOn: codeStream]