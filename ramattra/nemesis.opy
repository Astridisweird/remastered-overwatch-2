#!mainFile "../main.opy"

rule "[ramattra/nemesis.opy]: Disable Block during nemesis":
    @Event eachPlayer
    @Hero ramattra
    @Condition eventPlayer.isUsingAbility1() or eventPlayer.isUsingUltimate()

    eventPlayer.setSecondaryFireEnabled(false)


rule "[ramattra/nemesis.opy]: Enable shield when not in nemesis":
    @Event eachPlayer
    @Hero ramattra
    @Condition not (eventPlayer.isUsingAbility1() or eventPlayer.isUsingUltimate())

    eventPlayer.setSecondaryFireEnabled(true)


rule "[ramattra/nemesis.opy]: deal more pummel damage":
    @Event playerDealtDamage
    @Hero ramattra
    @Condition eventPlayer.isUsingAbility1() or eventPlayer.isUsingUltimate()
    @Condition eventAbility == Button.ABILITY_1

    damage(victim, attacker, RAMATTRA_PUMMEL_DAMAGE/OW2_RAMATTRA_PUMMEL_DAMAGE*eventDamage - eventDamage)