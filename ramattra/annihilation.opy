#!mainFile "../main.opy"

rule "[ramattra/annihilation.opy]: increase annahilation damaage":
    @Event playerDealtDamage
    @Hero ramattra
    #@Condition eventAbility == Button.ABILITY_2
    @Condition eventPlayer.isUsingUltimate()
    
    damage(victim, null, eventDamage - (RAMATTRA_ANNIHILATION_DAMAGE/OW2_RAMATTRA_VORTEX_DAMAGE)*(eventDamage/eventPlayer._base_damage_scalar))