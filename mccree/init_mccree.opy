#!mainFile "../main.opy"

#!include "utilities/reset.opy"
#!include "utilities/custom_hp.opy"
#!include "utilities/hero_switched.opy"
#!include "heroes/mccree/deadeye.opy"
#!include "heroes/mccree/flashbang.opy"

rule "[mccree/init_mccree.opy] init mccree":
    @Event eachPlayer
    @Hero mccree
    #@Condition eventPlayer.call_init == true

    defaultHero()
    newHero(MCCREE_HEALTH, 0, 0)
    #eventPlayer.hp_health = 225
    removePassiveHealing()
    setUltCost(MCCREE_ULT_COST)
    eventPlayer.disallowButton(Button.ABILITY_2)
    #applyCustomHealth()

rule "[hero_switch.opy]: Detect switch to mccree":
    @Event eachPlayer
    @Hero mccree
    @Condition eventPlayer._hero_switched
           
    eventPlayer.call_init = true    