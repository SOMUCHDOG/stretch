package  player.states{

	import player.Player;
	public class WalkingState implements IPlayer{

		public function WalkingState() {}
		
		public function update(p:Player):void {
			/*p.x += p.velocity.x * p.pSpeed;	
			p.y += p.velocity.y * p.jumpSpeed;
			p.y += p.gravity + 10;*/
			
			if(p.velocity.x == 0){
				p.setState(Player.idle);
				
			/*p.x += p.velocity.x * p.pSpeed;
			p.y += p.velocity.y * p.jumpSpeed;
			p.y += p.gravity;*/
			

			}
			
			if (p.jump == true) {
				p.setState(Player.jumping);
				//trace("jump");
			}
			
			
		}
		public function enter(p:Player):void
		{
			//p.say("Fly...");
			//p.pSpeed = 10;
		}
		
		public function exit(p:Player):void
		{
			trace("exit walking");
			
		}

	}
	
}
