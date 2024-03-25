#!mainFile "../main.opy"

rule "[amp.opy] increased dmg to nearby allies":
    @Event eachPlayer
    @Hero lucio
    @Condition eventPlayer.isUsingAbility2() == true
    
    eventPlayer.setStatusEffect(null, Status.HACKED, 3)
    getPlayersInRadius(eventPlayer.getPosition(), 14, eventPlayer.getTeam(), LosCheck.OFF).startScalingSize(1.5, true)
    getPlayersInRadius(eventPlayer.getPosition(), 14, eventPlayer.getTeam(), LosCheck.SURFACES_AND_ALL_BARRIERS).setDamageDealt(125)
    #eventPlayer.startForcingOutlineFor(getPlayers(eventPlayer.getTeam()), true, Color.RED, OutlineVisibility.DEFAULT) # wont work cause of a workshop bug.
    waitUntil(not eventPlayer.isUsingAbility2(), Math.INFINITY)
    getPlayers(eventPlayer.getTeam()).setDamageDealt(100)
    eventPlayer.stopForcingOutlineFor(getAllPlayers())
    getPlayers(eventPlayer.getTeam()).stopScalingSize()