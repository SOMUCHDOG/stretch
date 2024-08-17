package  objects.mobile{
	
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	
	
	public class Ball extends MovieClip{
		
		public var bvx:Number;
		public var bvy:Number;
		public var held:Boolean = false;
		public var radius:Number = 26;
		public var gravity:Number;
		public var handBall:Point = new Point();
		public var hvx:Number;
		public var hvy:Number;
		public var airresist:Number = .3;
		public var floor:Number = 700;
		public var onBlock:Number = - 1;
		public var ceiling:Number = 100;
		public var wall1:Number;
		public var wall2:Number;

		public function Ball():void{}

		
		public function update():void {
			
			//trace ("handBall" + handBall.x, handBall.y);
			
			if (y + height/2 > floor) {
				hvy *= 0;
			}
			if (y > ceiling && y + hvy < ceiling){
				hvy *= 0;
				y = ceiling;
			}
			
			if (!held) {
				
			y += gravity + 5;
			//x += this.bvx;
			//y += this.bvy;
			}
			
			if(held) {
				
			x = handBall.x;
			y = handBall.y;
			this.bvx = hvx;
			this.bvy = hvy;
				
			}
			bvx *= airresist;
			bvy *= airresist;
				if (x + radius > stage.stageWidth) {
				x = stage.stageWidth - radius;
				bvx *= 1;
			} else if (x - radius < 0) {
				x = radius;
				bvx *= -1;
			} else if (y + radius > stage.stageHeight) {
				y = stage.stageHeight - radius;
				bvy *= 0;
			} else if (y - radius < 0) {
				y = radius;
				bvy *= -1.5;
			}
			
		}
		
	}
	
}
