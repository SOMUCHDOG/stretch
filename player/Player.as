package player{

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import player.states.IPlayer;
	import player.states.*;
	import PlayBall;

	public class Player extends MovieClip {

		public var pSpeed: Number = 10;
		public var jumpSpeed: Number = -20;
		public var velocity:Point = new Point();
		public var handX: Number;
		public var stateNumber:int = 0;
		public var gravity:Number;
		public var floor:Number = 700;
		public var onBlock:Number = -1;
		
		
		public var canJump: Boolean = true;
		public var jump:Boolean = false;
		public var ceiling:Number;
	
		
		public static const jumping: IPlayer = new JumpingState();
		public static const walking: IPlayer = new WalkingState();
		public static const idle: IPlayer = new IdleState();
		private var _previousState: IPlayer; //The previous executing state
		private var _currentState: IPlayer; //The currently executing state
		

		public function Player():void {
			_currentState = idle;
			velocity = new Point(x,y);			
			
		}

		public function update(): void {
			
			
			x += velocity.x * pSpeed;	
			y += velocity.y * jumpSpeed;
			y += gravity + 10;
			//trace(canJump);
			if (jump){
				velocity.y = 1;
				
			}
			if (y > floor) {
				velocity.y *= 0;
			}
			if (y > ceiling && y < ceiling){
				velocity.y *= 0;
				y = ceiling;
			}

		
				
			if (!_currentState) return; //If there's no behavior, we do nothing
			//stateNumber++; 
			_currentState.update(this);

			if (x + width/2 + velocity.x > stage.stageWidth || x  - width/2 + velocity.x < 0) {
				x = Math.max(0, Math.min(stage.stageWidth - width/2, x));
				velocity.x *= 0;
				
			}
			if (y + height/2 + velocity.y > stage.stageHeight || y- height/2 + velocity.y < 0) {
				y = Math.max(0, Math.min(stage.stageHeight - height/2, y));
				velocity.y *= 0;
			}
			//Change to distance to hand?
			/*public function get distanceToMouse():Number {
			var dx:Number = x - satage.mouseX;
			var dy:Number = y - stage.mouseY;
			return Math.sqrt(dx * dx + dy * dy);
		}*/
			
			
			
			
		}
		public function setState(newState:IPlayer): void {
			if (_currentState == newState) return;
			if (_currentState) {
				_currentState.exit(this);
			}
			_previousState = _currentState;
			_currentState = newState;
			_currentState.enter(this);
			stateNumber = 0;
		}

		public function get previousState():IPlayer {
			return _previousState;
		}

		public function get currentState():IPlayer {
			return _currentState;
		}
		
		
		//public function kd(evt:KeyboardEvent):void {
		//	
		//	
		//	if (evt.keyCode == Keyboard.A) {
		//		//alien.gotoAndStop(2);
		//		velocity.x = -1;
		//		trace ("A");


		//	} else if (evt.keyCode == Keyboard.D) {
		//		//alien.gotoAndStop(1);
		//		velocity.x = 1;
		//		trace ("D");


		//	} else if (evt.keyCode == Keyboard.W) {
		//		trace ("jump");
		//		if (canJump) {
		//			//jumping = true;
		//			//jumpPow = -37;
		//			jump = true;
		//		}


		//	} else if (evt.keyCode == Keyboard.S) {

		//		//Reset game function
		//	}

		//}
		}



	}


