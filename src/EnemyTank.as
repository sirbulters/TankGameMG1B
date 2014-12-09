package
{
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import events.ShootEvent;
	
	public class EnemyTank extends BaseTank
	{
		private var shotTimer:Timer;
		
		public function EnemyTank()
		{
			shotTimer = new Timer(3000 + Math.random()*2000);
			shotTimer.addEventListener(TimerEvent.TIMER, tick);
			shotTimer.start();
		}
		
		private function timer(e:TimerEvent):void
		{
			var the Event:ShootEvent = new ShootEvent(ShootEvent.SHOOT_BULLET);
			theEvent.shooter - this;
			dispatchEvent(theEvent);
		}
		
	}
	
}