#!mainFile "../main.opy
#!include "heroes/bastion/tank.opy"


rule "[sentry.opy] start sentry ":
    @Event eachPlayer
    @Hero bastion
    @Condition eventPlayer.isUsingAbility1() == true
    @Condition eventPlayer.tank_mode == 0

    eventPlayer.setMoveSpeed(0)
    eventPlayer.setKnockbackReceived(0)
    eventPlayer.setDamageDealt(110)
    eventPlayer.setDamageReceived(125)
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 0)


rule "[sentry.opy] abort sentry":
    @Event eachPlayer
    @Hero bastion
    @Condition eventPlayer.isUsingAbility1() == false

    eventPlayer.setDamageDealt(100)
    eventPlayer.setDamageReceived(100)
    eventPlayer.setKnockbackReceived(100)
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 0)
    
# thanks for ecks for letting me steal this code rq
rule "[sentry.opy] go back to sentry":
    @Event eachPlayer
    @Hero bastion
    @Condition eventPlayer.tank_mode == 0
    @Condition eventPlayer.isUsingAbility1() == true
    
    wait(1)
    waitUntil(not eventPlayer.isUsingAbility1(), 4.984)
    waitUntil(eventPlayer.isHoldingButton(Button.ABILITY_1) or not eventPlayer.isUsingAbility1(), 1)
    if eventPlayer.isUsingAbility1() and not eventPlayer.isHoldingButton(Button.ABILITY_1):
        wait()
        eventPlayer.cancelPrimaryAction()
        eventPlayer.forceButtonPress(Button.ABILITY_1)
    if RULE_CONDITION:
        goto RULE_START 