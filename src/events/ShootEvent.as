package events
{
	public class ShootEvent extends Event
	{
		public function ShootEvent()
		{
			
			public static const SHOOT_BULLET = "ShootBullet";
			public var shooter:BaseTank;
			public function ShootEvent(event:String)
			{
				super(event);
			}
		}
	}
}