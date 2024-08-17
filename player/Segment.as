package player{

	import flash.display.Sprite;
	import flash.geom.Point;


	public class Segment extends Sprite {

		private var color:uint;
		public var segmentWidth: Number;
		public var segmentHeight: Number;
		public var floor:Number = 700;
		public var onBlock:Number = -1;

		public var vx: Number = 0;
		public var vy: Number = 0;

		public function Segment(segmentWidth: Number, segmentHeight: Number, color: uint = 0xffffff) {
			// constructor code
			color = 0x9900FF;
			this.segmentWidth = segmentWidth;
			this.segmentHeight = segmentHeight;
			this.color = color;
			init();
		}

		public function init(): void {

			//draw the segment itself
			graphics.lineStyle(1, 0x663399, 1);
			graphics.beginFill(color);
			graphics.drawRoundRect(-segmentHeight / 2, -segmentHeight / 2,
				segmentWidth + segmentHeight,
				segmentHeight,
				segmentHeight,
				segmentHeight);
							
			graphics.endFill();
			
			

			//draw the two "pins"
			//graphics.drawCircle(0, 0, 2);
			//graphics.drawCircle(segmentWidth, 0, 2);

		}

		public function getPin(): Point {

			//This is finding the right hand pin
			//Since this is "forward kinematics" we only worry about the right hand pin
			var angle: Number = rotation * Math.PI / 180;
			var xPos: Number = x + Math.cos(angle) * segmentWidth;
			var yPos: Number = y + Math.sin(angle) * segmentWidth;
			return new Point(xPos, yPos);
		}

	}

}