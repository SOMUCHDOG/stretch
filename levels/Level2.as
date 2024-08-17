package levels {
	
	import PlayBall;
	
	
	public class Level2 {

		public function Level2() {
		}
		
		public function createLevel2():void {
			
					addChildAt(_topSkull, 1);
					_topSkull.x = 513.5;
					_topSkull.y = 206.85;
					_topSkull.gotoAndStop(1);
					addChildAt(_jaw, 0);
					_jaw.x = 513.5;
					_jaw.y = 480;
					addChildAt(_level2, 0);

					player1.x = 25;
					player1.y = 350;
					
					platforms[0].x = 138;
					platforms[0].y = 247;
					platforms[0].width = 136.65;
					platforms[0].height = 23.9;

					platforms[1].x = 350;
					platforms[1].y = 410;
					platforms[1].width = 128.2;
					platforms[1].height = 28.85;

					platforms[2].x = 140;
					platforms[2].y = 510;
					platforms[2].width = 275.3;
					platforms[2].height = 30;

					platforms[3].x = 760;
					platforms[3].y = 600;
					platforms[3].width = 532.1;
					platforms[3].height = 30;


					_hand.x = 250;
					_hand.y = 150;
					_hand.vy = 0;
					_hand.vx = 0;


					balls[1].x = 260.5;
					balls[1].y = 2.55;
					balls[0].x = 350;
					balls[0].y = 50;

					addChildAt(_skullTrigger, 8);
					_skullTrigger.x = 620;
					_skullTrigger.y = 350;

					_levelTrigger.visible = false; //can't find the parent of this to removeChild
					_level2.visible = false;

					removeChild(_button1);
					removeChild(_button2);
					removeChild(_button3);
					removeChild(_bridge1);
					removeChild(_bridge2);
					removeChild(_piston);

		}

	}
	
}
