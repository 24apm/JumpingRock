package
{
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	
	[SWF(backgroundColor="0x000000" ,width="760" ,height="630")] 
	public class Main extends Sprite
	{
		private var _map:Map;
		public function Main()
		{
			trace("Main loaded");
			_map = new Map();
			addChild(_map);
		}
	}
}