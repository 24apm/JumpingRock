package
{
	import event.ItemEvent;
	
	import flash.display.Sprite;
	import flash.events.Event;

	public class Map extends UIElement
	{
		private var _background:UILoader;
		private var _rocks:Vector.<Rock>;
	//	private var _currentRock:Rock;
		private var _char:Character;
		
		private var _bgLayer:Sprite;
		private var _charLayer:Sprite;
		private var _rockLayer:Sprite;
		
		private var _statusBar:StatusBar;
		public function Map()
		{
			super();
		}
		protected override function init(e:Event = null):void
		{
			super.init();
			initLayer();
			initStatusBar();
			initBG();
			initChar();
			initRocks();
		}
		private function initStatusBar():void
		{
			_statusBar = new StatusBar();
			addChild(_statusBar);
		}
		private function initLayer():void
		{
			_bgLayer = new Sprite();
			addChild(_bgLayer);
			
			_rockLayer = new Sprite();
			addChild(_rockLayer);
			
			_charLayer = new Sprite();
			addChild(_charLayer);
		}
		private function initBG():void
		{
			_background = new UILoader(AssetTranslationTable.MAP);
			_bgLayer.addChild(_background);
		}
		private function initChar():void
		{
			_char = new Character(AssetTranslationTable.CAT);
			_charLayer.addChild(_char);
		}
		private function initRocks():void
		{
			_rocks = new Vector.<Rock>();
			var rock:Rock;
			for (var i:int = 0; i < 20; i++)
			{
				rock = new Rock(AssetTranslationTable.ROCK);
				_rocks.push(rock);
				_rockLayer.addChild(rock);
				rock.x = Util.rand(0, stage.stageWidth);
				rock.y = Util.rand(0, stage.stageHeight);
			}
			_char.x = _rocks[0].x;
			_char.y = _rocks[0].y;
			
			addEventListener(ItemEvent.ITEM_CLICKED, itemClicked);
		}
		private function itemClicked(e:ItemEvent):void
		{
			if(e.item is Rock)
			{
				_char.x = e.item.x;
				_char.y = e.item.y - _char.height + e.item.height * 0.5;
				_statusBar.addScore(10);
			}
		}
		public override function destruct():void
		{
			if(_background)
			{
				_background.destruct();
				_background = null;
			}
			super.destruct();
		}
	}
}