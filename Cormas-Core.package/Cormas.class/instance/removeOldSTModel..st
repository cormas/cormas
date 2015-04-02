model saving&loading ST
removeOldSTModel: aModelName
	"aModelName = <String>
	Si un modele de meme nom est deja charge, on nettoie"
	
	| aCategory |
	(Models keys includes: aModelName asSymbol)
		ifTrue:
			[Notice
				show: 'Removing previous version... in progress'
				while:
					[self closeModel.
					aCategory := (Models at: aModelName asSymbol) category.
					Cursor wait
						showWhile:
							[| classes |
							classes := (Models at: aModelName asSymbol) allClasses.
							classes
								reverseDo:
									[:cls | cls isObsolete not ifTrue: [cls quietlyRemoveFromSystem]].
							(Models organization listAtCategoryNamed: aCategory) isEmpty
								ifTrue:
									[Models organization removeCategory: aCategory.
									ChangeSet current reorganizeSystem]]]]