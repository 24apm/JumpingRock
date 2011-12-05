package
{
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class StatusBar extends UIElement
	{
		private var _scoreLabel:UILabel;
		private var _timerLabel:UILabel;
		private var _timer:Timer;
		
		private var _time:int = 100;
		private var _score:int = 0;
		
		private static const SCORE_LABEL:String = "SCORE: ";
		private static const TIMER_LABEL:String = "TIMER: ";
		
		public function StatusBar()
		{
			super();
		}
		
		protected override function init(e:Event=null):void
		{
			super.init(e);
			
			_scoreLabel = new UILabel(SCORE_LABEL + "0");
			addChild(_scoreLabel);

			_timerLabel = new UILabel(TIMER_LABEL + "100");
			addChild(_timerLabel);
			_timerLabel.x = 100;
			
			_timer = new Timer(1000);
			_timer.addEventListener(TimerEvent.TIMER, onTimer);
			_timer.start();
		}
		private function onTimer(e:TimerEvent):void
		{
			_time--;
			_timerLabel.text = TIMER_LABEL + _time.toString();
		}
		public function addScore(value:uint):void
		{
			_score += value;
			_scoreLabel.text = SCORE_LABEL + _score;
		}
		public function subScore(value:uint):void
		{
			_score -= value;
			_scoreLabel.text = SCORE_LABEL + _score;
		}
	}
}