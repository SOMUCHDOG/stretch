package {

	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;



	import player.Player;
	import player.Segment;
	import player.Hand;
	import objects.mobile.Ball;

	import objects.Platform;
	import UI.Menu;
	import levels.Level2;
	import flash.sampler.Sample;
	import flash.media.Camera;

	import objects.mobile.Piston;
	import player.states.IdleState;
	import player.states.JumpingState;
	import player.states.WalkingState;

	//Controls
	/*
	Hold down mouse for more Power (There is a max)
	Spacebar to grab an object
	A/D to move
	S to Jump
	
	
	/*
	//STRETCH ARMS
	//GRAB OBJECTS
	//STRETCH RESISTANCE
	OBJECT RESISTANCE
	//RETRACT ARMS (also stretch resistance)
	LEVEL DESIGN
	RUNNING ANIMATION
	
	
	
	JUMP ANIMATION
	JUMP FEATURE
	//HOLD FOR POWER(Currently bases power off of distance from character)
	
	
	
	MOBILE OBJECTS CLASS (ball)
	IMMOBILE OBJECTS CLASS (wall)
		
	*/
	public class PlayBall extends MovieClip {

		//PHYSICS
		private var gravity: Number = 0.5;
		private var bounce: Number = -0.1;
		private var radius: Number = 26;
		private var targetDx: Number;
		private var targetDy: Number;

		public var power: Number = 1;
		public var maxPower: Number = 100;
		public var pvx: Number = 0;
		public var pvy: Number = 0;
		public var jumpPow: Number = 0;
		public var jumping: Boolean = false;
		public var jumpFrames: uint = 0;

		//OBJECTS
		public var _levelTrigger: nextLevel = new nextLevel();
		public var _hand: Hand = new Hand();
		public var player1: Player;
		public var _piston: Piston;
		public var _bridge1: drawBridge;
		public var _bridge2: drawBridge;
		public var _level1ForeGround: ForegroundL1 = new ForegroundL1;
		public var _acidPond: AcidPond = new AcidPond();
		public var _backGround: Background = new Background();
		public var _alien: playerBox = new playerBox;
		

		//LAYERS
		public var foreGroundLayer: Sprite;
		public var backGroundLayer: Sprite;
		public var objectsLayer: Sprite;
		public var platformLayer: Sprite;


		//BUTTONS
		public var numButtons: uint = 3;
		public var buttons: Array;
		public var _button1: PushButton = new PushButton();
		public var _button2: PushButton = new PushButton();
		public var _button3: PushButton = new PushButton();


		//BALLS
		public var balls: Array;
		public var numBalls: uint = 2;
		public var _ball1: Ball;
		public var _ball2: Ball;

		//ARMS
		private var segments: Array;
		private var numSegments: uint = 10;

		//BOOLEANS
		public var charge: Boolean = false;
		private var grab: Boolean = false;
		private var grabbing: Boolean = false; // immovable
		private var holding: Boolean = false; //moveable
		public var isLevelOne: Boolean = true;
		public var isLevelTwo: Boolean = false;


		//platforms

		public var platforms: Array; //dakota
		public var numPlats: uint = 5; //dakota set number of platforms that spawn
		public var platWidth: Number; //dakota
		public var platHeight: Number; //dakota
		public var floor: Number = 700;
		public var _platform: Platform = new Platform();

		// level2 assets
		public var _skull: TopSkull = new TopSkull();		
		public var _skullTrigger: SkullTrigger = new SkullTrigger();
		public var skullPlay: Boolean = false;
		public var _level2Foreground: ForegroundL2;
		public var _treeTrunk: TreeTrunk = new TreeTrunk();
		public var _treeBranch: TreeBranch = new TreeBranch();

		//reach variables
		public var sWidth: Number = 5;
		public var mouseTarget: Point = new Point(250, 150);
		public var returnVel: Number;


		public var objs: Array = new Array();


		public function PlayBall() {
			// constructor code
			init()
		}

		private function init(): void {

			
			player1 = new Player();



			backGroundLayer = new Sprite();
			addChildAt(backGroundLayer, 0);

			foreGroundLayer = new Sprite();
			addChildAt(foreGroundLayer, 1);

			objectsLayer = new Sprite();
			addChildAt(objectsLayer, 2);

			platformLayer = new Sprite();
			addChildAt(platformLayer, 3);

			backGroundLayer.addChild(_backGround);
			_backGround.x = 0;
			_backGround.y = 0;
			//_backGround.visible = false;

			foreGroundLayer.addChild(_level1ForeGround);
			_level1ForeGround.x = 0;
			_level1ForeGround.y = 0;
			//_level1ForeGround.visible = false;

			foreGroundLayer.addChild(_acidPond);
			_acidPond.width = 275;
			_acidPond.height = 50;
			_acidPond.x = 660;
			_acidPond.y = 405;

			//needs an array

			objectsLayer.addChild(player1);
			player1.x = 20;
			player1.y = 222;

			
			
			//level two trigger area
			objectsLayer.addChild(_levelTrigger);

			_levelTrigger.x = 875;
			_levelTrigger.y = 175;
			//trace(_levelTrigger.parent);

			//LEVEL 1
			// balls array
			balls = new Array();
			for (var j: uint = 1; j < numBalls; j++) {
				_ball1 = new Ball();
				_ball2 = new Ball();
				_ball1.radius = radius;
				_ball2.radius = radius;
				objectsLayer.addChild(_ball1);
				_ball1.x = 200;
				_ball1.y = 100;
				balls.push(_ball1);
				objs.push(_ball1);
				objectsLayer.addChild(_ball2);
				_ball2.x = 250;
				_ball2.y = 100;
				balls.push(_ball2);
				objs.push(_ball2);

			}

			/*balls[1].x = 200;
			balls[1].y = 100;
			balls[0].x = 250;
			balls[0].y = 100;*/



			buttons = new Array();
			for (var B: uint = 1; B < numButtons; B++) {

				objectsLayer.addChild(_button1);
				_button1.x = 428;
				_button1.y = 302;
				buttons.push(_button1);

				objectsLayer.addChild(_button2);
				_button2.x = 27;
				_button2.y = 500;
				buttons.push(_button2);
				_button2.rotation = 90;

				objectsLayer.addChild(_button3);
				_button3.x = 540.45;
				_button3.y = 340.3; // fixed size and position for heisman's overlay
				_button3.width = 50;
				_button3.height = 50;
				_button3.rotation = 90;
				buttons.push(_button3);

			}

			//add piston
			_piston = new Piston();
			backGroundLayer.addChild(_piston);
			_piston.x = 315;
			_piston.y = 490;

			//add bridges
			_bridge1 = new drawBridge();
			foreGroundLayer.addChild(_bridge1);
			_bridge1.x = 794.2;
			_bridge1.y = 322;


			_bridge2 = new drawBridge();
			foreGroundLayer.addChild(_bridge2);
			_bridge2.x = 199.2;
			_bridge2.y = 100.05;
			_bridge2.height = 100;
			_bridge2.rotation = 90;

			//arms array
			segments = new Array();
			for (var i: uint = 0; i < numSegments; i++) {
				var segment: Segment = new Segment(sWidth, 10);
				objectsLayer.addChild(segment);
				segments.push(segment);
				//objs.push(segment);


			}
			//platforms array
			platforms = new Array();
			for (var p: uint = 0; p < numPlats; p++) {
				var _platform: Platform = new Platform;
				platformLayer.addChild(_platform);
				platforms.push(_platform);
				//platforms[p].visible = false;
			}




			//sets locations of platforms for level 1
			platformLayer.addChild(platforms[0]);			
			platforms[0].x = 300.55 + 229.95 / 2;
			platforms[0].y = 330.5 + 81;
			platforms[0].width = 229.95;
			platforms[0].height = 165.95;

			platformLayer.addChild(platforms[1]);
			platforms[1].x = 2.15 + 505;
			platforms[1].y = 635.5;
			platforms[1].width = 1010; //fixed positions of platforms
			platforms[1].height = 10;


			platformLayer.addChild(platforms[2]);
			platforms[2].x = 0.05 + 104.48;
			platforms[2].y = 329.6 + 81;
			platforms[2].width = 208.95;
			platforms[2].height = 165.95;


			platformLayer.addChild(platforms[3]);
			platforms[3].x = 804 + 100;
			platforms[3].y = 325.55;
			platforms[3].width = 199.95;
			platforms[3].height = 10;

			platformLayer.addChild(platforms[4]);
			platforms[4].x = 675;
			platforms[4].y = 520;
			platforms[4].width = 300;
			platforms[4].height = 250;
			

			segments[numSegments - 1].x = player1.x + 12;
			segments[numSegments - 1].y = player1.y + 12;
			_hand.segment = segments[5];
			_hand.segment2 = segments[0];



			objectsLayer.addChild(_hand);

			_hand.x = 250;
			_hand.y = 150;
			_hand.vy = 0;
			_hand.vx = 0;

			objs.push(player1);
			objs.push(_hand);
			
			objectsLayer.addChildAt(_alien,7);

			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			addEventListener(Event.ADDED_TO_STAGE, setUpStage);


		}
		public function setUpStage(evt: Event): void {
			//stage.align = StageAlign.TOP_LEFT;
			//stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDowns);
			stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUps);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDowns);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUps);

		}

		private function onEnterFrame(event: Event): void {
			
			
			/*trace (_levelTrigger.parent);
			trace ("acidPond" + _acidPond.x, _acidPond.y, _acidPond.parent);
			trace("drawbridge2" + _bridge2.x, _bridge2.y,_bridge2.parent); 
			trace ("drawBridge1" + _bridge1.x, _bridge1.y, _bridge1.parent);
			trace("piston" + _piston.x, _piston.y);
			trace("platforms" + platforms.length);
			trace ("balls" + numBalls, _ball1.x, _ball1.y, _ball2.x, _ball2.y); */
			
			player1.gravity = gravity;
			//_hand.gravity = gravity * 10;
			//trace(_hand.gravity);

			_alien.x = player1.x;
			_alien.y = player1.y;

			if (player1.canJump) {
				//pretty sure this is were the jump is broken
			}


			for (var j: int = 0; j < platforms.length; j++) {

				for each(var o: MovieClip in objs) {
					platforms[j].checkObj(o, j);
					if (o.y > o.floor) {
						o.y = o.floor;
					}
					//trace (_hand.floor);

				}
			}
			/*			for (var s: int = 0; s < platforms.length; s++) {
				
				for each(var S: Segment in segments) {
					platforms[s].checkSeg(S, s);
					if (S.y > S.floor) {
						S.y = S.floor;

			}
		}
	}*/

			//arms follow player
			segments[numSegments - 1].x = player1.x;
			segments[numSegments - 1].y = player1.y - 8;

			_hand.update();

			_piston.x = 315;

			player1.visible = false;
			player1.update();
			player1.x += pvx;
			player1.y += pvy;

			/*if (jumpFrames >= 6) {
				jumping = false;
				player1.canJump = false; //temp fix for jump
				jumpFrames = 0;
			}*/

			if (jumping) {

				var jumpStrength: Number = jumpPow += gravity;
				player1.y += jumpStrength;
				jumpFrames += 1;


			}

			for each(var bball: Ball in balls) {
				bball.update();
				bball.gravity = gravity;
				bball.handBall.x = _hand.x;
				bball.handBall.y = _hand.y;
				bball.hvx = _hand.vx;
				bball.hvy = _hand.vy;

			}


			//level two create - needs own state
			if (player1.hitTestObject(_levelTrigger) && isLevelOne) {
				gotoAndStop(2);
				createLevel2();
				isLevelTwo = true;
				isLevelOne = false;
				
			}

			//arms variables
			var dx: Number = segments[5].x - _hand.x;
			var dy: Number = segments[5].y - _hand.y;
			var dist: Number = Math.sqrt(dx * dx + dy * dy);
			var stretch: Number = dist / 6;




			if (charge = true) {
				power += 5;

			}

			if (power >= maxPower) {
				power = maxPower;
			}

			//reach function
			var target: Point = reach(segments[0], _hand.x, _hand.y);
			for (var i: uint = 1; i < numSegments; i++) {

				var segment: Segment = segments[i];
				target = reach(segment, target.x, target.y);
				segment.segmentWidth = stretch;

			}

			//segment position?
			for (i = numSegments - 1; i > 0; i--) {
				var segmentA: Segment = segments[i];
				var segmentB: Segment = segments[i - 1];
				position(segmentB, segmentA);
			}

			//platform & player hitTest
			//collisions for ball,hand,box and player with platform
			for each(var p: Platform in platforms) {
				

				if (player1.hitTestObject(_bridge1)) {
					player1.y = _bridge1.y - player1.height; //fixed 12/9
					//player1.velocity.y *= 0;
					//player1.gravity *= 0;
				}

				if (player1.hitTestObject(_acidPond) && !isLevelTwo) {
					player1.x = 20;
					player1.y = 222;
					_hand.x = 250;
					_hand.y = 150;
					_hand.vy = 0;
					_hand.vx = 0;
				}


				// CAN I IMPORT PISTON AND DO THIS COLLISION IN BALL UPDATE??
				for each(var _ball: Ball in balls) {
					//piston ball collision
					if (_ball.hitTestObject(_piston)) {
						_ball.x = _piston.x - _ball.radius;
						/*holding = false;
						_ball.held = false;*/
					}
					

					for each(var _Btn: PushButton in buttons) {
						if (_ball1.hitTestObject(_Btn)) {
							_Btn.gotoAndStop(2);
						} if (_ball2.hitTestObject(_Btn)) {
							_Btn.gotoAndStop(2);
						}else {
							_Btn.gotoAndStop(1);
						}
						
					}

					//ball platform collision
					/*	if (_ball.hitTestObject(p)) {
						_ball.y = p.y - _ball.radius;

					}*/

					if (_ball.hitTestObject(_bridge2)) { // trap door collision
						_ball.y = _bridge2.y - _ball.radius;
					}
					if (_ball.hitTestObject(_bridge1)) {
						_ball.y = _bridge1.y - _ball.radius;
					}
					if (_ball.hitTestObject(_button1)) { // move piston trigger						
						_ball.y = _button1.y - _ball.radius;
						_piston.x = 70.25;
					}



					if (_ball.hitTestObject(_button2)) { // draw bridge
						_bridge1.rotation = -90;
					}

					if (_ball.hitTestObject(_button3)) { // trap door
						_bridge2.rotation = 180;
					}





					//level 2 collisions
					if (_ball.hitTestObject(_skull)) {
						skullPlay = true;
						skullOpen();
						
					}					
				}			
			}



		}
		
		public function skullOpen():void {
			if (skullPlay = true) {
						_skull.gotoAndPlay(1);
						//trace (skullPlay);
					} else {
						skullPlay = false;
					}
		}
		public function createLevel2():void {
			if (isLevelTwo = true) {


					foreGroundLayer.addChildAt(_skull,3);
					_skull.x = 513.5;
					_skull.y = 206.85;
					_skull.gotoAndStop(1);
					
					_level2Foreground = new ForegroundL2();
					foreGroundLayer.addChildAt(_level2Foreground,0);
					_level2Foreground.x = 0;
					_level2Foreground.y = 455;
					//_level2Foreground.visible = false;

					foreGroundLayer.addChild(_treeTrunk);
					_treeTrunk.x = 0;
					_treeTrunk.y = 40;

					foreGroundLayer.addChild(_treeBranch);
					_treeBranch.x = .5;
					_treeBranch.y = 40;

					player1.x = 25;
					player1.y = 350;

					platforms[0].x = 138;
					platforms[0].y = 247;
					platforms[0].width = 200;
					platforms[0].height = 23.9;


					platforms[1].x = 315;
					platforms[1].y = 480;
					platforms[1].width = 140;
					platforms[1].height = 150;

					platforms[2].x = 140;
					platforms[2].y = 510;
					platforms[2].width = 275.3;
					platforms[2].height = 30;

					platforms[3].x = 760;
					platforms[3].y = 650;
					platforms[3].width = 532.1;
					platforms[3].height = 30;

					//platformLayer.removeChild(platforms[4]);
					//platforms.splice(platforms[4]);
					platforms.pop();
					
					_hand.x = 250;
					_hand.y = 150;
					_hand.vy = 0;
					_hand.vx = 0;

					
					_ball1.x = 260.5;
					_ball1.x = 350;
					_ball2.y = 2.55;					
					_ball2.y = 50;
					
					objectsLayer.addChildAt(_skullTrigger, 8);
					_skullTrigger.x = 620;
					_skullTrigger.y = 350;

					//objectsLayer.removeChild(_levelTrigger);//
					_levelTrigger.visible = false; //can't find the parent of this to removeChild
					

					objectsLayer.removeChild(_button1);
					objectsLayer.removeChild(_button2);
					objectsLayer.removeChild(_button3);
					foreGroundLayer.removeChild(_bridge1);
					foreGroundLayer.removeChild(_bridge2);
					backGroundLayer.removeChild(_piston);
					foreGroundLayer.removeChild(_level1ForeGround);
					foreGroundLayer.removeChild(_acidPond);

				}
		}

		private function reach(segment: Segment, xpos: Number, ypos: Number): Point {

			var dx: Number = xpos - segment.x;
			var dy: Number = ypos - segment.y;
			var angle: Number = Math.atan2(dy, dx);
			segment.rotation = angle * 180 / Math.PI;

			var w: Number = segment.getPin().x - segment.x;
			var h: Number = segment.getPin().y - segment.y;
			var tx: Number = xpos - w;
			var ty: Number = (ypos - h) + gravity;

			return new Point(tx, ty);
		}

		private function position(segmentA: Segment, segmentB: Segment): void {

			segmentA.x = segmentB.getPin().x;
			segmentA.y = segmentB.getPin().y;
		}


		private function onMouseDowns(event: MouseEvent): void {

			mouseTarget.x = mouseX;
			mouseTarget.y = mouseY;
			power = 1;
			charge = true;
		}

		private function onMouseUps(event: MouseEvent): void {

			charge = false;

			var shotAngle: Number = Math.atan2(stage.mouseY - _hand.y, stage.mouseX - _hand.x);

			_hand.vx += Math.cos(shotAngle) * power / 2;
			_hand.vy += Math.sin(shotAngle) * power / 2;
		}

		private function onKeyDowns(evt: KeyboardEvent): void {
			if (evt.keyCode == 32) {
				grab = true;
				hitTest();
				_hand.gotoAndStop(2);
			}
			//had to move these because movement wasn't working
			if (evt.keyCode == Keyboard.A) {
				//alien.gotoAndStop(2);
				player1.velocity.x = -1;
				_alien.scaleX = -1;
				trace("A");
				//_alien.gotoAndPlay(1);
				

			} else if (evt.keyCode == Keyboard.D) {
				//alien.gotoAndStop(1);
				player1.velocity.x = 1;
				_alien.scaleX = 1;
				trace("D");
				//_alien.gotoAndPlay(1);

			} else if (evt.keyCode == Keyboard.W) {
				trace("jump");
				//_alien.gotoAndPlay(19);
				jumping = true;
				jumpPow = -37;
				//if (jumping) {
				//	jumping = true;
				//	jumpPow = -37; commented out just to see what was causing jump not to work
				//	//jump = true;
				//}


			} else if (evt.keyCode == Keyboard.R) {

				//Reset game function
				player1.x = 20;
				player1.y = 222;
				_hand.x = 250;
				_hand.y = 150;
				_hand.vy = 0;
				_hand.vx = 0;
			}

		}
		private function onKeyUps(evt: KeyboardEvent): void {


			if (evt.keyCode == 32) {
				grab = false;
				_hand.gotoAndStop(1);
				for each(var upBall: Ball in balls) {
					upBall.held = false;
				}

				if (grabbing) {

					grabbing = false;
				}

				if (holding) {
					holding = false;

				}
			}
			if (evt.keyCode == Keyboard.A) {

				player1.velocity.x = 0;



			} else if (evt.keyCode == Keyboard.D) {

				player1.velocity.x = 0;


			} else if (evt.keyCode == Keyboard.W) {
				player1.velocity.y = 0;
				jumping = false;
			}

		}

		public function hitTest(): void {

			for each(var hitBall: Ball in balls) {

				if (_hand.hitTestObject(hitBall) && !grabbing && !holding) {

					holding = true;
					hitBall.held = true;


				}
			}
		}
	}
}