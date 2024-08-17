package objects{
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Point;
	import player.Segment;
	
	
	public class Platform extends MovieClip {

		public function Platform() {}
		
		public function checkObj(obj:MovieClip, place:Number):void {
			
			if (obj.x + obj.width/2 > x - width/2 && obj.x < x - width/2 + 7 && Math.abs(obj.y-y) <height/2) {
				obj.x = x - width/2 - obj.width/2;
				
			}
			if (obj.x - obj.width/2 < x + width/2 && obj.x > x + width/2 - 7 && Math.abs(obj.y - y) < height/2) {
				obj.x = x + width/2 + obj.width/2;
			}
			if (Math.abs(obj.x - x) < width/2 + obj.width/2 && obj.y < y - height/2 && obj.floor > y - height/2 && obj.onBlock!=place){
				obj.floor = y - height/2 - obj.height/2;
				obj.onBlock = place;
			}
			if (Math.abs(obj.x - x) >= width/2 + obj.width/2 && obj.onBlock == place) {
				
				obj.onBlock = -1;
				obj.floor = 700;
				
				
			}
			if (obj.y - obj.height/2 < y + height/2 && obj.y >y && Math.abs(obj.x - x) < width/2 + obj.width/2) {
				obj.y = y + height/2 + obj.height/2;
				
			}
			if (Math.abs(obj.x - x) < width/2 + obj.width/2 && obj.y > y + height/2){
				obj.ceiling = y + height/2;
			}
			if (Math.abs(obj.x - x) < width/2 + obj.width/2 && obj.y < y + height/2){
				obj.ceiling = 0;
			}
		}
		
			//public function checkSeg(obj:Segment, place:Number):void {
			
			
				/*if (obj.x + obj.width/2 > x - width/2 && obj.x < x - width/2 + 7 && Math.abs(obj.y-y) <height/2) {
				obj.x = x - width/2 - obj.width/2;
				
			}
			if (obj.x - obj.width/2 < x + width/2 && obj.x > x + width/2 - 7 && Math.abs(obj.y - y) < height/2) {
				obj.x = x + width/2 + obj.width/2;
			}
			if (Math.abs(obj.x - x) < width/2 + obj.width/2 && obj.y < y - height/2 && obj.floor > y - height/2 && obj.onBlock!=place){
				obj.floor = y - obj.height/2;
				obj.onBlock = place;
			}
			if (Math.abs(obj.x - x) >= width/2 + obj.width/2 && obj.onBlock == place) {
				obj.onBlock = -1;
				obj.floor = 700;
			}
			if (obj.y - obj.height/2 < y + height/2 && obj.y >y && Math.abs(obj.x - x) < width/2 + obj.width/2) {
				obj.y = y + height/2 + obj.height/2;
			}*/
			
		}

	}
	

