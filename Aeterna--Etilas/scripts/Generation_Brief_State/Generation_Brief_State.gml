function briefing_data_init()
{
    global.briefing_text = {};
    
    global.briefing_text[$ "species"] =
        "SPECIES\n\n"
        + "Choose your character's species.\n\n"
        + "Species determines the base majority of your character and is the defining feature of what your character is and what they are naturally good at. Pay attention to their Attribute Adjustments, CDT, Knowledge Skills, Talents, Abilites, and Weaknesses of each species to determine which best fits your character idea. Once your Species is selected the Confirm button will appear Green and you can continue. For hotkeys see the box on the top left. Additionally hovering over terms you are unfamiliar with may provide additional information.\n\n"

        + "- If you wish to view this screen again click the '?' button at the top right.\n\n";
    
    global.briefing_text[$ "attributes"] =
        "ATTRIBUTES\n\n"
		+ "Assign Attributes using the Roll Pool.\n\n"
        + "On this screen you will allocate your Attribute rolls either by utilizing randomly generated numbers or adding them manually using the 'Manual Rolls' button by the end of the roll pool. After clicking that button you can click an existing roll and overwrite it with another number. After you will select a value and assign it one of your 10 Attributes. Each Attribute has its own characteristics which aren't explained mathematically but are shown within the Attribute box. It is important that you assign good values to Attributes you intend to use more often. In general high values are always better. Boxes outlined in Cyan are being modified by your selected species as noted as 'Species +/- X'. Green outlines signified Attributes with assigned values. \n\n"
        + "- Once all Attributes are assigned, and bonuses are selected the Confirm button becomes available.";
    
    global.briefing_text[$ "generation"] =
        "SKILLS & TALENTS\n\n"
        + "Spend your character points for additional bonuses.\n\n"
        + "On this screen you will be given your allotment of Character Points. With these points you can improve your Critical Damage Threshold (CDT), buy 20 additional starting gold, buy Knowledge Tables for 2 points, or Skills and Talents for 1 point each unless they are from a Knowledge Table that you do not own. It is important to note that you cannot access the Skills or Talents of a table until the tables are locked. Tables can be locked and unlocked at any time. Each skill and talent have descriptions and tooltips to provide information on how the checks are calculated and the difficulty of its training. The higher the check the better as this system utilizes a roll under ruleset. Skills and Talents followed by (X) are specialization skill and require a specialization to be chosen from a list. You may choose other specializations at the cost of additional points.\n\n"
        + "-Plan around your species fixed skills and table access.";
    
    global.briefing_text[$ "equipment"] =
        "EQUIPMENT\n\n"
        + "Outfit your character for play.\n"
        + "• Browse available gear and add items to your loadout.\n"
        + "• Watch weight, cost, and any starting budget limits.\n"
        + "• Remove or adjust items before confirming.\n\n"
        + "Confirm when your starting equipment is set.";
}