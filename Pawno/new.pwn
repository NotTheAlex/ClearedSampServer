//------------------------------INCLUDES----------------------------------------
#include <a_samp>
//------------------------------DEFINES-----------------------------------------
//------------------------------FORWARDS----------------------------------------
//------------------------------VARIABLES---------------------------------------
new sadm[][] = {"namemode by yor name �"};
new auth[][] = {"E-mail: "};
new year[][] = {"year"};
new gVisitors=0;
/*public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print(" Blank Filterscript by your name here");
	print("--------------------------------------\n");
	return 1;
}
public OnFilterScriptExit()
{
	return 1;
}*/

//------------------------------MAIN--------------------------------------------
main()
{
print("\n--------------------------------------");
printf("Load: %s (%s)", sadm,year);
print("Idea -  (site)");
printf("Contact Us: %s",auth);
print("--------------------------------------\n");
}
//------------------------------GAMEMODE INIT-----------------------------------
public OnGameModeInit()
{
	SetGameModeText("new");
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
	return 1;
}
//------------------------------GAMEMODE EXIT-----------------------------------
public OnGameModeExit()
{
print("\n--------------------------------------");
printf("UnLoad: %s (%s)", sadm,year);
print("Idea -  (site)");
printf("Contact Us: %s",auth);
print("--------------------------------------\n");
return 1;
}
//------------------------------������-----------------------------------------
public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}
//------------------------------ר�� ��� ������---------------------------------
public OnPlayerRequestSpawn(playerid)
{
	return 1;
}
//------------------------------�������-----------------------------------------
public OnPlayerConnect(playerid)
{
	//�������� ��� ����
	
    new name[16], st[256];
    GetPlayerName(playerid, name,sizeof(name));
    format(st, sizeof(st), "%s[ID:%d] ����������� � �������!",name, playerid);
    
    SendClientMessageToAll(0xFFFFFFFF,st);
    //��������
    gVisitors ++;
    new viss[256];
	format(viss, sizeof(viss), "%d ����������� � ��������� �������", gVisitors);
	SendClientMessage(playerid, 0xFFFFFFFF,viss);
	return 1;
}
//------------------------------����������--------------------------------------
public OnPlayerDisconnect(playerid, reason)
{
	new name[ 24 ], string[ 256 ],reas[10];
	GetPlayerName( playerid, name, 24 );
	if(reason == 0) return format(reas,10," �����");
	if(reason == 1) return format(reas,10," �����");
	if(reason == 2) return format(reas,10," ���");
    format(string, sizeof(string), "%s[ID:%d] ���������� �� �������!(%s)",name, playerid, reas);
    SendClientMessageToAll(0xFFFFFFFF,string);
	return 1;
}
//------------------------------�����-------------------------------------------
public OnPlayerSpawn(playerid)
{
	return 1;
}
//------------------------------������------------------------------------------
public OnPlayerDeath(playerid, killerid, reason)
{
	new playercash;
    if(killerid == INVALID_PLAYER_ID)
	{
    SendDeathMessage(INVALID_PLAYER_ID,playerid,reason);
    }
    else
    {
    SendDeathMessage(killerid,playerid,reason);
	SetPlayerScore(killerid,GetPlayerScore(killerid)+1);
	playercash = GetPlayerMoney(playerid);
	if (playercash > 0)  {
	GivePlayerMoney(killerid, playercash/4);
	GivePlayerMoney(playerid, -playercash/4);
	}
	}
    new oldlevel;
    new newlevel;
    oldlevel = GetPlayerWantedLevel(killerid);
    newlevel = oldlevel + 1;
    SetPlayerWantedLevel(killerid, newlevel);
    SetPlayerWantedLevel(playerid, 0);
    return 1;
}
//------------------------------����� �����-------------------------------------
public OnVehicleSpawn(vehicleid)
{
	return 1;
}
//------------------------------������� �����-----------------------------------
public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}
//------------------------------�����-------------------------------------------
public OnPlayerText(playerid,text[])
{
	new playername[24], playertext[256],ye,mo,da,ho,mi,se;
	GetPlayerName(playerid, playername, 24);
	getdate(ye,mo,da);
	gettime(ho,mi,se);
    format(playertext, sizeof(playertext), "[%d.%d.%d|%d:%d:%d]: %s [%d]: %s\r\n",ye,mo,da,ho,mi,se,playername, playerid, text[0]);
    SendClientMessageToAll(GetPlayerColor(playerid), playertext);
    return 0;
}
//------------------------------�������� ���������------------------------------
public OnPlayerPrivmsg(playerid, recieverid, text[])
{
    new sendername[24], recname[24],pmforplayer[256],pmforsender[256],ye,mo,da,ho,mi,se;
    GetPlayerName(playerid,sendername,24);
    GetPlayerName(recieverid,recname,24);
	getdate(ye,mo,da);
	gettime(ho,mi,se);
	format(pmforplayer,256,"[%d.%d.%d|%d:%d:%d] �� ������� �� �� %s(ID %i): %s",da,mo,ye,ho,mi,se,sendername,playerid,text[0]);
	format(pmforsender,256,"[%d.%d.%d|%d:%d:%d] �� �������� �� � %s(ID %i): %s",da,mo,ye,ho,mi,se,recname,recieverid,text[0]);
	SendClientMessage(recieverid,0xFFFFFFFF,pmforplayer);
	SendClientMessage(playerid,0xFFFFFFFF,pmforsender);
	GameTextForPlayer(recieverid,"You have a new PM!",5000,3);
	PlayerPlaySound(recieverid, 1150, 0.0, 0.0, 0.0);
	return 0;
}
//------------------------------������� �����-----------------------------------
public OnPlayerCommandText(playerid, cmdtext[])
{
	return 0;
}

public OnPlayerInfoChange(playerid)
{
	return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}
