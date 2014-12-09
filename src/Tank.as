package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import events.ShootEvent;

	public class Tank extends extends BaseTank
	{
		private var tankBodyArt:MovieClip
		private var tankTurretArt:TankTurretArt;

		
		public function Tank()
		{
	
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			stage.addEventListener(MouseEvent.CLICK, onClick);
		}
				
		private function onClick(e:MouseEvent):void
		{
			var theEvent:ShootEvent = new ShootEvent(ShootBullet.SHOOT_BULLET);
			theEvent.shooter = this;
			
			dispatchEvent(theEvent);
		}
		
	}
}