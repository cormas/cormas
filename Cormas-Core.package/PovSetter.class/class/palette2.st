interface specs
palette2
	"Tools.UIPainter new openOnClass: self andSelector: #palette2"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: #(UserMessage 
				#key: #ColorTool 
				#defaultString: 'Color Tool' 
				#catalogID: #UIPainter) 
			#min: #(Point 243 236) 
			#max: #(Point 360 292) 
			#bounds: #(Rectangle 747 508 1106 777)) 
		#component: #(SpecCollection 
			#collection: #(#(LabelSpec 
				#layout: #(Point 5 129) 
				#label: #(UserMessage 
					#key: #V 
					#defaultString: 'V' 
					#catalogID: #UIPainter)) #(LabelSpec 
				#layout: #(Point 4 171) 
				#name: #hueLabel 
				#label: #(UserMessage 
					#key: #H 
					#defaultString: 'H' 
					#catalogID: #UIPainter)) #(CompositeSpecCollection 
				#collection: #() 
				#compositeSpec: #(CompositeSpec 
					#layout: #(LayoutFrame 32 0 6 0 -6 1 125 0) 
					#name: #colorSpace 
					#flags: 8 
					#isOpaque: true)) #(LabelSpec 
				#layout: #(Point 4 151) 
				#name: #saturationLabel 
				#label: #(UserMessage 
					#key: #S 
					#defaultString: 'S' 
					#catalogID: #UIPainter)) #(LabelSpec 
				#layout: #(AlignmentOrigin 0 0.374332 0 0.8 0.5 0) 
				#name: #backgroundChipLabel 
				#label: #(UserMessage 
					#key: #Backgrnd 
					#defaultString: 'Backgrnd' 
					#catalogID: #UIPainter) 
				#style: #small) #(LabelSpec 
				#layout: #(AlignmentOrigin 0 0.62 0 0.73 0.5 0) 
				#name: #selectionForegroundChipLabelTop 
				#label: #(UserMessage 
					#key: #Selection 
					#defaultString: 'Selection' 
					#catalogID: #UIPainter) 
				#style: #small) #(LabelSpec 
				#layout: #(AlignmentOrigin 0 0.62 0 0.8 0.5 0) 
				#name: #selectionForegroundChipLabel 
				#label: #(UserMessage 
					#key: #Foregrnd 
					#defaultString: 'Foregrnd' 
					#catalogID: #UIPainter) 
				#style: #small) #(LabelSpec 
				#layout: #(AlignmentOrigin 0 0.87 0 0.73 0.5 0) 
				#name: #selectionBackgroundChipLabelTop 
				#label: #(UserMessage 
					#key: #Selection 
					#defaultString: 'Selection' 
					#catalogID: #UIPainter) 
				#style: #small) #(LabelSpec 
				#layout: #(AlignmentOrigin 0 0.87 0 0.8 0.5 0) 
				#name: #selectionBackgroundChipLabel 
				#label: #(UserMessage 
					#key: #Backgrnd 
					#defaultString: 'Backgrnd' 
					#catalogID: #UIPainter) 
				#style: #small) #(LabelSpec 
				#layout: #(AlignmentOrigin 0 0.12 0 0.8 0.5 0) 
				#name: #foregroundChipLabel 
				#label: #(UserMessage 
					#key: #Foregrnd 
					#defaultString: 'Foregrnd' 
					#catalogID: #UIPainter) 
				#style: #small))))