A menu item is part of a menu (see class Menu).  Each menu item represents an item that can be chosen from the menu.  If a menu item is not enabled then it cannot be chosen from the menu but it will still appear.  A menu item can have a key sequence associated with it that can be used to select the menu item without selecting it with the pointer.

The menu item label may define an access or accelerator key character.  The character after the first ampersand (&) will be the access character for the menu item (for LookPolicy's that have the concept of an access character).  The ampersand will not appear in the label, it just marks the character that should be the access character.  To get an ampersand to appear in the label, use two consecutive ampersands (&&).

The implementation code for any method is private to the class.  Users of any class should not rely on knowledge of implementation of that class or any of its methods.

Instance Variables
	label <CharacterArray | UserMessage> the label string to appear on the menu item.
	enabled <Boolean | ValueModel> is the menu item enabled (selectable) or not.
	adornment <MenuItemAdornment | nil> has any optional adornment information specified.
	helpText	<String | Text | nil> a short explanation of the item for the context help system.
	nameKey	<Symbol | nil>	identifier for programmatic access of this item in a menu.
	position	<Float | nil>	preferred position from top of menu indexed by <group>.<group position>.
	value	<Symbol | BlockClosure>	selector or block to be performed as item selection action.

NOTE:  The fact that a MenuItem uses a MenuItemAdornment is completely PRIVATE to class Menu.  MenuItemAdornment is a PRIVATE implementation class of MenuItem.


Object Reference
A MenuItem is an entry in a Menu, consisting primarily of a string label to be displayed in the menu. The value that is typically associated with a MenuItem is held by the menu and cannot be obtained from the item. 
A MenuItem can be created by sending #labeled: to this class. However, it is typically created indirectly, by sending an item-adding message to a menu, or by using the Menu Editor tool or a MenuBuilder. 
In addition to its inherited abilities, a MenuItem knows how to: 
	-Use a Text as its label instead of a string (labeling-text protocol) 
	-Set and get a graphic image or visual component to be displayed beside or instead of its label (labeling-image) 
	-Set and get a shortcut character (shortcut key) 
	-Set and get the index of the character in its label that is to be underlined as an access character (labeling-access character) 
	-Set and get an on-off indicator beside its label (indication) 
	-Set and get a color to be applied to it (color) 
	-Set and get a Menu to be used as a submenu (submenu) 
