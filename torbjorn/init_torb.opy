#!mainFile "../main.opy"

#!include "heroes/torbjorn/overload.opy"


rule "[torbjorn/init.opy]: Detect switch to Torbjorn":
    @Event eachPlayer
    @Hero torbjorn

    eventPlayer.call_init = true


rule "[torbjorn/init.opy]: Initialize Torbjorn":
    @Event eachPlayer
    @Hero torbjorn
    @Condition eventPlayer.call_init

    newHero(TORBJORN_HEALTH, TORBJORN_ARMOR, 0)
    setUltCost(TORBJORN_ULT_COST)
    removePassiveHealing()

    setBaseDamage(eventPlayer, TORBJORN_TURRET_DAMAGE/OW2_TORBJORN_TURRET_DAMAGE)

    eventPlayer.call_init = false


rule "[torbjorn/init.opy]: Correct Rivet Gun and ultimate damage":
    @Event playerDealtDamage
    @Hero torbjorn
    @Condition eventAbility in [Button.PRIMARY_FIRE, Button.SECONDARY_FIRE, Button.ULTIMATE]

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)