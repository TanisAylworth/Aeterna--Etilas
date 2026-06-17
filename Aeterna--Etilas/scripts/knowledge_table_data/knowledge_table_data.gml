function knowledge_tables_data()
{
    global.knowledge_table_data = {};

global.knowledge_table_data[$ "General"] =
    {
        skills :
        [
            "Animal Handling",
            "Sailing",
            "Bribery"
        ],

        talents :
        [
            "Woodsman",
            "Beast Friend"
        ]
    };


    global.knowledge_table_data[$ "Survival"] =
    {
        skills :
        [
            "Animal Handling",
            "Tracking",
            "Foraging",
            "Navigation"
        ],

        talents :
        [
            "Woodsman",
            "Beast Friend"
        ]
    };

    global.knowledge_table_data[$ "Arcane"] =
    {
        skills :
        [
            "Spellcraft",
            "Runes",
            "Alchemy"
        ],

        talents :
        [
            "Mystic Insight"
        ]
    };
}