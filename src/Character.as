package
{
	import flash.events.Event;

	public class Character extends UIElement
	{
		private var _url:String;
		private var _character:UILoader;
		public function Character(url:String)
		{
			super();
			_url = url;
		}
		protected override function init(e:Event = null):void
		{
			super.init(e);
			_character = new UILoader(_url);
			addChild(_character);
		}
		public override function destruct():void
		{
			if(_character)
			{
				_character.destruct();
				_character = null;
			}
			super.destruct();
		}
	}
}