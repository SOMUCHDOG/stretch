package  player.states{

	import player.Player;
	public class JumpingState implements IPlayer{

		public function JumpingState() {}
		
		public function update(p:Player):void {
			
			
			if (p.jump = false){
				p.canJump = true;
				p.setState(Player.idle);
				
			}
			
			
		}
		public function enter(p:Player):void
		{
			trace("jumping");
			//p.pSpeed = 0;
		}
		
		public function exit(p:Player):void
		{
			trace("exit jump");
			
		}

	}
	
}
