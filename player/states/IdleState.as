package  player.states{

	import player.Player;
	public class IdleState implements IPlayer{

		public function IdleState() {}
		
		public function update(p:Player):void {
			
			if (p.velocity.x == 1 || p.velocity.x == -1) {
				p.setState(Player.walking);
				//p.stateNumber = 30;
			}
			
			if (p.jump == true) {
				p.setState(Player.jumping);
				//trace("jmp");
			}
			
			
		}
		public function enter(p:Player):void
		{
			trace("Idling...");
			//p.pSpeed = 0;
		}
		
		public function exit(p:Player):void
		{
			trace("exit idle");
			
		}

	}
	
}
