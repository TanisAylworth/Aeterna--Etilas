Name = string("Jorgenson");
// Run this inside the Player's Create Event or a "SetSpecies" function
Species_Data = global.Species_DATA.Human_Muttish;
// Now pull the data into the Player instance variables
SpeciesName  = Species_Data.Name;
CDT          = Species_Data.CDT;
Strength     = Species_Data.Str;
Dexterity    = Species_Data.Dex;
Reflexes     = Species_Data.Ref;
Endurance    = Species_Data.End;
Willpower    = Species_Data.Wil;
Perception   = Species_Data.Per;
Intelligence = Species_Data.Int;
Toughness    = Species_Data.Tgh;
Charm        = Species_Data.Cha;
Leadership   = Species_Data.Ldr;



LeftHand = 0;
RightHand = global.item_list.ShortSword;






