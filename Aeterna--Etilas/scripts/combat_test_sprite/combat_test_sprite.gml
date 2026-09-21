function species_to_sprite(species_key)
{
    // Assign real sprites as you make them
    switch (species_key)
    {
        case "muttish_human":
        case "holdstadtish_human":
        case "corintish_human":
            return spr_species_muttish_human;          // placeholder
            
        case "goblin":
            return spr_species_goblin;
        case "orc":
            return spr_species_orc;
        case "gnoll":
            return spr_species_gnoll;
        case "kobold":
            return spr_species_kobold;
        case "minos":
            return spr_species_minos;
        case "felinim":
            return spr_species_felinim;
        // ... add as assets exist
        
        default:
            return spr_combat_unknown; // grey circle / stick figure
    }
}