extends Node

var life_boss = 1000
var walking

func boss_life_update(life):
	life_boss -=  life
