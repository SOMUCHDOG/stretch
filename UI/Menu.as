package UI {
	
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import PlayBall;
	
	public class Menu extends MovieClip{		

		public function Menu() {
			
			createStartMenu();			
		}
		
		private function createStartMenu():void {
			var _menu:StartMenu = new StartMenu();
			//initialize start screen movie clip
			addChild(_menu);
			
			
			_menu.startButton.addEventListener(MouseEvent.CLICK, startGameHandler);
		}
		private function startGameHandler(evt:MouseEvent):void
		{
			
			removeChild(evt.currentTarget.parent);
			//on mouse click removechild - start screen
			evt.currentTarget.removeEventListener(MouseEvent.CLICK, startGameHandler);
			
			createGame();
			//on click go to main game
		}
		
		public function createGame():void
		{
			var game:PlayBall = new PlayBall();
			//trace (gameScore.parent);
			
			addChild(game);
			//initialize shoot game script
		}

	}
	
}
