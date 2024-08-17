package {
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	
	
	/*
	You will need to create an array of platforms in another class and call one of the functions using the parameters 
	I believe this is all that you will need to get the platforms working.
	
	//START COPY
	
	public var numPlats: uint = 4;
	public var objs: Array = new Array();
	
	//You will need to push a MovieClip into obs yourself
	
	push.//MovieClipName
	
	//platforms array
	
		platforms = new Array();
			for (var p: uint = 0; p < numPlats; p++) {
				var _platform: Platform = new Platform;
				addChild(_platform);
				platforms.push(_platform);
			}
	
	
		for (var j: int = 0; j < platforms.length; j++) {

				for each(var o: MovieClip in objs) {
					platforms[j].checkObj(o, j);
					if (o.y > o.floor) {
						o.y = o.floor;

					}
					
		//END COPY
	*/
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
				obj.y = y - height/2 + obj.height/2;
				
			}
		}
		
			public function checkSeg(obj:Segment, place:Number):void {
			if (obj.x + obj.width/2 > x - width/2 && obj.x < x - width/2 + 7 && Math.abs(obj.y-y) <height/2) {
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
				obj.y = y - height/2 + obj.height/2;
			}
		}

	}
	
}
