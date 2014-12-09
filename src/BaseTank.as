package
{
	import flash.display.MovieClip;

	public class BaseTank extends MovieClip
	{
		protected var tankodyArt:MovieClip;
		protected var tankTurretArt:TankTurretArt;
		public var turretRotation:Number;
		public var speed:Number = 0;
		public var turretLength:Number;
		
		
		public function BaseTank()

		{
			
			this.scaleX = this.scaleY = 0.2;
			
			
			tankBodyArt = new TankBodyArt();  //instantieren van de Class
			this.addChild(tankBodyArt);
			tankTurretArt = new TankTurretArt();
			this.addChild(tankTurretArt);
			
			turretLength - tankTurretArt.width * this.scaleX;
		}
		
		public function turnTurret(rotation:Number):void
		{
			tankTurretArt.rotation = rotation;
			turretRotation = rotation;
		}
		
		public function update():void
		{
			
			//rijden voor de tank
			var radians:Number = this.rotation * Math.PI / 180;
			var xMove:Number = Math.cos(radians);
			var yMove:Number = Math.sin(radians);
			
			this.x += xMove * -speed;
			this.y += yMove * -speed;
			
			
			//draaien turret
			var diffX:Number = mouseX;
			var diffy: Number = mouseY;
			radians = Math.atan2(diffy, diffX)
			var degrees:Number = radians * 180 / Math.PI;
			
			tankTurretArt.rotation = degrees;
			turretRotation = degrees;
			
		}
	}
}