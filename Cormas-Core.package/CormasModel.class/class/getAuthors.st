description - primitives
getAuthors
	
	| authors lesAuteurs lesEMails |
	authors := List new.
	lesAuteurs := Cormas textAsList: self authors.
	lesEMails := Cormas textAsList: self emails.
	lesAuteurs size > lesEMails size
		ifTrue:
			[lesEMails size + 1
				to: lesAuteurs size
				do: [:i | lesEMails add: ' ']].
	lesAuteurs
		with: lesEMails
		do:
			[:a :e | 
			authors
				add:
					((Author new)
						name: a;
						email: e)].
	^authors