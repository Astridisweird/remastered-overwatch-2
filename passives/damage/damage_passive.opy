#!mainFile "../main.opy"


rule "[passives/damage/damage_passive.opy]: Remove DPS passive (Dealing damage reduces enemy healing received)":
    @Event playerDealtDamage
    @Condition eventPlayer.getCurrentHero() in getDamageHeroes()
    
    victim.setHealingReceived(85)
    wait(3)
    victim.setHealingReceived(100)