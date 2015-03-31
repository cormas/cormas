xml-rpc
buildXmlRpcModelRepresentation
	"Return an XML-RPC representation of the model"
	
	| repModel repViews repAtts repAgents |
	repViews := List
		withAll:
			(views keys
				collect:
					[:idView | 
					| view repView |
					view := views at: idView.
					repView := Dictionary new.
					repView
						at: 'Id'
						put: idView asNumber.
					view
						at: #type
						ifPresent: [:type | repView at: 'Type' put: type].
					view
						at: #grammaire
						ifPresent:
							[:grammaire | 
							| repComp |
							repView
								at: 'EntiteGrammaire'
								put: grammaire first.
							repComp := List new.
							2
								to: grammaire size
								do: [:index | repComp add: (grammaire at: index)].
							repView at: 'ComplementGrammaire' put: repComp].
					view
						at: #legende
						ifPresent: [:legende | repView at: 'Legende' put: legende].
					view
						at: #attribut
						ifPresent:
							[:attribut | 
							repView
								at: 'IdRef'
								put: (attribut at: #ref) asNumber.
							attribut
								at: #couleur
								ifPresent: [:couleur | repView at: 'Couleur' put: couleur].
							attribut
								at: #url
								ifPresent: [:url | repView at: 'URL' put: url].
							attribut
								at: #modif
								ifPresent: [:modif | repView at: 'Modif' put: modif]].
					view
						at: #seuil
						ifPresent:
							[:seuil | 
							repView
								at: 'Seuil1'
								put: seuil first.
							repView
								at: 'Seuil2'
								put: (seuil at: 2)].
					view
						at: #urls
						ifPresent:
							[:urls | 
							repView
								at: 'URL1'
								put: urls first.
							repView
								at: 'URL2'
								put: (urls at: 2)].
					view
						at: #vuerefs
						ifPresent:
							[:vuerefs | 
							repView
								at: 'VueRef'
								put: (vuerefs collect: [:vueref | vueref asNumber])].
					repView]).
	repAtts := List
		withAll:
			(attributes
				collect:
					[:attribute | 
					| repAtt |
					repAtt := Dictionary new.
					repAtt
						at: 'Id'
						put: (attribute at: #id).
					repAtt
						at: 'Name'
						put: (attribute at: #name).
					repAtt
						at: 'Type'
						put: (attribute at: #type).
					repAtt]).
	repAgents := List
		withAll:
			(agents keys
				collect:
					[:name | 
					| agentClass repAgentClass |
					agentClass := agents at: name.
					repAgentClass := Dictionary new.
					repAgentClass at: 'Name' put: name.
					repAgentClass
						at: 'URL'
						put: (agentClass at: #url).
					repAgentClass]).
	repModel := Dictionary new.
	repModel at: 'SizeX' put: dimX.
	repModel at: 'SizeY' put: dimY.
	repModel at: 'Connexite' put: connexity.
	repModel at: 'Delimiteur' put: delimiter.
	repModel at: 'VectVues' put: repViews.
	repModel at: 'Attributs' put: repAtts.
	repModel at: 'Agents' put: repAgents.
	^repModel