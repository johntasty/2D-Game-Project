/// @description Insert description here
// You can write your code in this editor
if(!global.haveFlamethrower)
{	if (instance_exists(obj_NPC_maud)){
		obj_NPC_maud.npcName = "maudStage1";}
}

if(global.ethelDead && !global.harveyDead && !global.darveyDead && global.haveFlamethrower)
{
	obj_NPC_maud.npcName = "maudStage2";
}

if(!global.ethelDead && !global.harveyDead && !global.darveyDead && global.haveFlamethrower)
{
	obj_NPC_maud.npcName = "maudStage3";
}

if(global.harveyDead && !global.ethelDead && !global.darveyDead && global.haveFlamethrower)
{
	obj_NPC_maud.npcName = "maudStage4";
}

if(global.ethelDead && global.harveyDead && global.darveyDead && global.haveFlamethrower)
{
	obj_NPC_maud.npcName = "maudStage5";
}

//Darvey
if(global.harveyDead)
{
	obj_NPC_darvey.npcName = "darveyStage3";
}
