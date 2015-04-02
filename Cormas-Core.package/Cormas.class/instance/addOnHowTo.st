main menu
addOnHowTo
	
	| txt txtNum txtCharter |
	txtNum := '	Add-On Manager' asText emphasizeAllWith: #(#bold #large).
	txtCharter := '
A Cormas Add-on can be of the two following type
- ST - The add-on is saved in a .st file
- Parcel - The add-on is saved as a parcel with a .pcl file and .pst file. Both files are requiered.

All Cormas add-on files should be saved in the '
		, ('directory cormas\Add-ons' asText emphasizeAllWith: #(#large)) ,
			'

'
		,
			('-- How to install a Cormas add-on --' asText emphasizeAllWith: #(#large))
		,
			'
Copy the ST file or the pcl and pst files in the of the directory cormas\Add-ons.
Open the Add-On, select the desired add-on and clic ''Load''. If you want to remmember the list of add-ons you want to load each time you open Cormas, yuo can save your list with the ''floppy disk'' button. Beware: you will still have to clic on the "Load" button each time you re-open Cormas.

'
		,
			('-- How to create an add-on as a ST file --' asText emphasizeAllWith:
					#(#large)) ,
			'
1/ In a SmallTalk Browser select the methods or class that make up your add-on and save them in a ST file using - Right Clic -> fileOut -
2/ Put the file in the Add-ons directory
3/ To set the add-on meta info, do the following
- Open a VisualWorks File Browser (in the VisualWorks main window) and browse to your ST file. Now you can see and edit the content of the ST file. 
- In between the first XML tag (e.g. <?xml version="1.0"?>) and the second XML tag (e.g. <st-source>) insert the following lines (you don''t need to include them all) 
	<Add-On-Name> HERE TYPE THE NAME OF THE ADD-ON </Add-On-Name>
	<Add-On-Version> HERE TYPE THE VERSION OF THE ADD-ON </Add-On-Version>
	<Add-On-Author> HERE TYPE THE AUTHOR NAME OF THE ADD-ON </Add-On-Author>
	<Add-On-Category> HERE TYPE THE CATEGORY OF THE ADD-ON YOU WANT TO BE DISPLAYED IN THE ADD-ON MANAGER WINDOW </Add-On-Category>
	<Add-On-Description> HERE TYPE A SHORT DESCRIPTION OF THE ADD-ON </Add-On-Description>
- Save the edits you made in the ST file by - Right Clic -> accept - 


'
		,
			('-- How to create an add-on as a Parcel --' asText emphasizeAllWith:
					#(#large)) ,
			'
1/ In a SmallTalk Browser go to Package meneu and create a new packag. Gite a name.
2/ Select the methods or class that make up your add-on and drag-and-drop to your package on the left side of the SmallTalk Browser (Package View)
3/ Right clic your package (left side of the browser) and  select ''Publish as Parcel...''. Validate by clicking ''Publish''
4/ Put the file in the Add-ons directory
5/ Setting the add-on meta info (Version, Author, Categoy, Description), is not yet working
'.
	txt := txtNum , txtCharter.
	ComposedTextView
		open: txt asValue
		label: 'Add-On manager: How To'
		icon: (Icon constantNamed: #workspace)
		extent: 700 @ 300