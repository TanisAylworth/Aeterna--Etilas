
// Step Event


var cc = global.char_creation;

// Modal briefing: eat the whole frame of UI input
if (briefing_update(global.char_creation)) exit;   // or return; — do NOT call step_update / step_enter at all
if (!is_struct(cc)) exit;
if (!variable_struct_exists(cc, "steps")) exit;

var step = cc.steps[cc.step_index];

// lifecycle (safe now)
step_enter(cc);
step_update(cc);

// Start the music
if (audio_is_playing(cc_music))
{
    var pos = audio_sound_get_track_position(cc_music);

    if (pos >= 110)
    {
        audio_sound_set_track_position(cc_music, 3);
    }
}