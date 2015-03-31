private - irregular polygons creation
voisinsPolygonesNoeuds: lesPolygones
	"CB + CLP, Jan 2000"
	
	| boundingRectangle p pPrec pCour allPolygones |
	lesPolygones isEmpty
		ifFalse:
			[allPolygones := self cormasModel
				perform:
					('the' , lesPolygones first class name asString , 's') asSymbol.
			lesPolygones
				do:
					[:b | 
					b neighbourhood isNil ifTrue: [b neighbourhood: Set new].
					b nodes: Dictionary new.
					boundingRectangle := Rectangle
						origin: b bounds origin
						corner: b bounds corner.
					boundingRectangle origin x: boundingRectangle origin x - 1.
					boundingRectangle origin y: boundingRectangle origin y - 1.
					boundingRectangle corner x: boundingRectangle corner x + 1.
					boundingRectangle corner y: boundingRectangle corner y + 1.
					allPolygones
						do:
							[:c | 
							b ~= c
								ifTrue:
									[(c bounds regionIntersects: boundingRectangle)
										ifTrue:
											["c est POTENTIELLEMENT voisin... on le verifie ici rigoureusement..."
											"et par la meme occasion, on memorise les noeuds !!!"
											pPrec := c outline includes: (b outline at: 1).	"Point precedent inclus ?"
											1
												to: b outline size
												do:
													[:i | 
													p := b outline at: i.
													pCour := c outline includes: p.
													pPrec & pCour not
														ifTrue:
															[b neighbourhood add: c.
															(b nodes keys includes: c)
																ifFalse:
																	[b nodes
																		at: c
																		put: OrderedCollection new].
															(b nodes at: c)
																add:
																	(i = 2
																		ifFalse: [i - 1]
																		ifTrue: [b outline size])].	"(b nodes at: c) add: i-1]."
													pPrec not & pCour
														ifTrue:
															[b neighbourhood add: c.
															(b nodes keys includes: c)
																ifFalse:
																	[b nodes
																		at: c
																		put: OrderedCollection new].
															(b nodes at: c)
																add:
																	(i = b outline size
																		ifFalse: [i]
																		ifTrue: [1])].	"(b nodes at: c) add: i]."
													pPrec := pCour].
											(b nodes keys includes: c)
												ifTrue:
													[b nodes
														at: c
														put: (b nodes at: c) asSortedCollection]]]]]]