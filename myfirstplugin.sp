//Include files
#include <sourcemod>

//My info for plugin information
public Plugin:myinfo = {
    name = "My First Plugin",
    author = "gu58us",
    description = "This is a simple first plugin description",
    url = ""
};

// Everything that gets loaded by the plugin when it is started.
public OnPluginStart()
{
    RegAdminCmd("sm_testing", Command_Something, ADMFLAG_SLAY, "This is a test command, this is what comes up when you guery the command");
}

//Function that is triggered by sm_testing
public Action:Command_Something(client, args)
{
    if(args < 1)
    {
        PrintToConsole(client, "[SM] Usage: sm_testing <message>");
        return Plugin_Handled;
    }
    //Set the strings for the print
    new String:Arg1[32], String:name[32];
    //Get the arg provided with sm_testing <arg1>
    GetCmdArg(1, Arg1, sizeof(Arg1));
    //Get the Users name
    GetClientName(client, name, sizeof(name));
    //Print the message to chat
    //if the users name is fred and the arg provided is world
    //Chat will say "Fred: world"
    PrintToChatAll("%s: %s", name, Arg1);

    return Plugin_Handled;
}
