package player.states //Where is the folder?
{
	import player.Player;//Import the class object that will be targeted	
	
	public interface IPlayer 
	{
		//primary functions within all the Agent states
		function update(p:Player):void; 
		function enter(p:Player):void;
		function exit(p:Player):void;
	}
	
}