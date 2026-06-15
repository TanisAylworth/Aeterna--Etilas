function skill_difficulty_name(diff)
{
    switch(diff)
    {
        case global.SKILL_SIMPLE:  return "Simple";
        case global.SKILL_INTERMEDIATE: return "Intermediate";
        case global.SKILL_ADVANCED:    return "Advanced";
    }

    return "Unknown";
}