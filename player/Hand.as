package player {

	/*	import Segment;
	import player;*/
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.geom.Point;

	public class Hand extends MovieClip {

		public var vy: Number;
		public var vx: Number;
		public var gravity: Number = 0.5;
		public var maxVel: Number = 80;
		public var minVel: Number = -80;
		public var segment: Segment;
		public var segment2: Segment;
		public var shoulder:Segment;
		public var holding: Boolean = false;
		public var grabbing: Boolean = false;
		public var floor: Number = 700;
		public var onBlock: Number = -1;
		public var ceiling: Number;

		public function Hand() {}

		public function update(): void {


			//this.y += gravity;
			this.x += vx;
			this.y += vy;
			vy += gravity;
			this.rotation = segment.getPin().x;
			
			platformstopper();



			var dx: Number = segment.getPin().x - x;
			var dy: Number = segment.getPin().y - y;
			var dist: Number = Math.sqrt(dx * dx + dy * dy);
			
			
		

			if (x + width / 2 > segment.getPin().x + 60) {
				//x = _wall.x - width/2;
				vx += -3;
			} else if (x - width / 2 < segment.getPin().x - 60) {
				//x =  segment.getPin().x -120 + width/2;
				vx += 3;
			} else if (y + width / 2 > segment.getPin().y + 60) {
				//y = (segment.getPin().y + 120) - width/2;
				vy += -3;

			} else if (y - width / 2 < segment.getPin().y - 60) {
				//y = segment.getPin().y - 120 + width/2;
				vy += 3;
			}
			if (vx > - 3 && vx < 3) {
				vx = 0;
			}



			if (x > x + stage.stageWidth + 100 || y > y + stage.stageHeight + 100) {
				x = segment.getPin().x;
				y = segment.getPin().y;
			}

			//STAGE BOUNDS (for hands) We need to make it an all object bounds

			if (x - width > stage.stageWidth) {
				x = stage.stageWidth - width / 2;
				//vx *= bounce;
			} else if (x - width < 0) {
				x = width;
				//vx *= bounce;
			} else if (y + width > stage.stageHeight) {
				y = stage.stageHeight - width;
				//vy *= bounce;
			} else if (y - width < 0) {
				y = width;
				//vy *= bounce;
			}

		}
		public function platformstopper():void {
			
			
			if (y > floor) {
				vy *= 0;
			}
			if (y + height/2 > ceiling && y + vy < ceiling){
				vy *= 0;
				y = ceiling + height/2;
			}

		
		}
		
	}
	}