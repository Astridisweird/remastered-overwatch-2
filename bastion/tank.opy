#!mainFile "../main.opy"

playervar tank_mode 

rule "[bastion/tank.opy] initialize tank mode":
    @Event eachPlayer
    @Hero bastion
    @Condition eventPlayer.isUsingUltimate() == true
    @Condition eventPlayer.tank_mode == 0
    
    eventPlayer.cancelPrimaryAction()
    eventPlayer.tank_mode = 1
    eventPlayer.disallowButton(Button.PRIMARY_FIRE)
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 0)
    eventPlayer.setSecondaryFireEnabled(true)
    eventPlayer.setDamageDealt(BASTION_TANK_MODE)
    wait()
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    eventPlayer.disallowButton(Button.ABILITY_1)
    wait(7)
    eventPlayer.tank_mode = 0
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.allowButton(Button.ABILITY_1)
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 0)
    eventPlayer.setSecondaryFireEnabled(false)
    eventPlayer.setDamageDealt(BASE_DAMAGE)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)


rule "[bastion/tank.opy] primary fire":
    @Event eachPlayer
    @Condition eventPlayer.tank_mode == 1
    @Condition eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == true
    
    eventPlayer.forceButtonPress(Button.SECONDARY_FIRE)

#rule"[bastion/tank.opy] not in tank mode":
    #@Event eachPlayer
    #@Condition eventPlayer.tank_mode == 0
   
    #wait(0.50)
    #eventPlayer.allowButton(Button.PRIMARY_FIRE)
    #eventPlayer.allowButton(Button.ABILITY_1)
    #eventPlayer.setAbilityCooldown(Button.ABILITY_1, 0)
    #eventPlayer.setSecondaryFireEnabled(false)
    #eventPlayer.setDamageDealt(BASE_DAMAGE)
    #eventPlayer.allowButton(Button.PRIMARY_FIRE)

#rule "[bastion/tank.opy] fix broken tank":
    #@Event eachPlayer
    #@Hero bastion
    #@Condition eventPlayer.tank_mode == 1
    #@Condition eventPlayer.isUsingUltimate() == false

    #eventPlayer.tank_mode = 0
    #eventPlayer.allowButton(Button.PRIMARY_FIRE)
    #eventPlayer.allowButton(Button.ABILITY_1)
    #eventPlayer.setAbilityCooldown(Button.ABILITY_1, 0)
    #eventPlayer.setSecondaryFireEnabled(false)
    #eventPlayer.setDamageDealt(BASE_DAMAGE)
    #eventPlayer.allowButton(Button.PRIMARY_FIRE)