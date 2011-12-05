package
{
	import event.ItemEvent;
	
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class Rock extends UIElement
	{
		
		private var _url:String;
		private var _loader:UILoader;
		public function Rock(url:String)
		{
			super();
			_url = url;
		}
		protected override function init(e:Event = null):void
		{
			super.init(e);
			_loader = new UILoader(_url);
			addChild(_loader);
			addEventListener(MouseEvent.ROLL_OVER, rOver);
			addEventListener(MouseEvent.ROLL_OUT, rOut);
			addEventListener(MouseEvent.CLICK, click);
		}
		private function rOver(e:MouseEvent):void
		{
			this.alpha = 0.8
		}
		private function rOut(e:MouseEvent):void
		{
			this.alpha = 1;
		}
		private function click(e:MouseEvent):void
		{
			dispatchEvent(new ItemEvent(ItemEvent.ITEM_CLICKED, this, true));
		}
		public override function destruct():void
		{
			if(_loader)
			{
				_loader.destruct();
				_loader = null;
			}
			super.destruct();
		}
	}
}