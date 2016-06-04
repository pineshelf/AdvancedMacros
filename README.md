# AdvancedMacros

Please explore the lua and xml to see how it works.

The macro to use: /script am_deathray_eviscerate()

You can use this as your default eviscerate button if you want to, its only function is to prevent it from being cast after it's registered a SPELLCAST_CHANNEL_START and then before a SPELLCAST_CHANNEL_STOP

On why I did it this way: I can't find an api function that checks deathray's channel, or any channeled spell for that matter.

IsCurrentAction works well for checking if things like frostbolt are being cast but channeled spells don't register for it.
UnitCastingInfo can't be used becuase it doesn't work at all.. I don't think its a 1.12 function

Which leads me to checking events and toggling a variable as I do in am_update_deathray_variable().

I was using the combat log to read the combat events of deathray ("You are afflicted by Gnomish Death Ray." and "Gnomish Death Ray fades from you.") but an interupted deathray still has to finish its damage on you before it fades from you so you'd have a ~5sec delay before you can start spamming eviscerating in the event that you got interupted. Thus, I moved to checking SPELLCAST_CHANNEL_START and SPELLCAST_CHANNEL_STOP. With this though it won't be limited to checking deathray, it will toggle on and off through any channeled spell. I'm not sure if that would ever arrise as an issue, though. (Could filter it by CHANNEL_START arg1, but CHANNEL_STOP doesn't have any args so it will easily create errors in a simple function and I'm not going to bother with it).

But all that said it would be greate if we could find a function like IsCurrentAction for channeled spells and do a simple if check. But until then, here's this.
