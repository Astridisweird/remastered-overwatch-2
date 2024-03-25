#!mainFile "../main.opy"

#!include "utilities/reset.opy"
#!include "utilities/custom_hp.opy"
#!include "utilities/hero_switched.opy"
#!include "heroes/bastion/sentry.opy"
#!include "heroes/bastion/self_repair.opy"
#!include "heroes/bastion/tank.opy"

rule "[bastion/init_bastion.opy] init bastion":
    @Event eachPlayer
    @Hero bastion
    #@Condition eventPlayer.call_init == true
    
    defaultHero()
    newHero(BASTION_HEALTH,BASTION_HEALTH_ARMOUR, 0)
    setUltCost(BASTION_ULT_COST)
    #eventPlayer.hp_health = 225
    #eventPlayer.hp_armour = 75
    #applyCustomHealth()
    eventPlayer.setSecondaryFireEnabled(false)
    applyCustomHp()
    removePassiveHealing()

rule "[hero_switch.opy]: Detect switch to bastion":
    @Event eachPlayer
    @Hero bastion
    @Condition eventPlayer._hero_switched
       
    eventPlayer.call_init = true    