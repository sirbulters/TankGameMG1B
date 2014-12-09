package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	
	import events.ShootEvent;
	
	public class Main extends Sprite
		{
			private var tank:Tank;
			private var dPressed:Boolean = false;
			private var aPressed:Boolean = false;
			private var wPressed:Boolean = false;
			private var sPressed:Boolean = false;
			
			private var input:Point;
			
			private var bullets:Array;
			private var enemies:Array;
			
			private var input:Point = new Point ();
			//private var speed:Number = 0;
			
			
			public function Main():void
				{
					if (stage) init();
					else addEventListener(Event.ADDED_TO_STAGE, init);
				}
		
		private function init(e:Event = null):void
			{
			
				input = new Point();
			
			
				removeEventListener(Event.ADDED_TO_STAGE, init);
				//entry point
				tank = new Tank();
				this.addChild(tank);
				tank.x = stage.stageWidth * 0.5;
				tank.y = stage.stageWidth * 0.5;
				tank.addEventListener(ShootEvent.SHOOT_BULLET, createBullet");
				//enemytank
				enemies = new Array();
				for (var i:int = 0; i < 4; i++ )
				{
					var enemy:EnemyTank = new EnemyTank();
					enemies.push(enemy);
					addChild(enemy);
					enemy.x = Math.random()*stage.stageWidth;
					enemy.y = Math.random()*stage.stageHeight;
					enemy.addEventListener(ShootEvent.SHOOT_BULLET, createBullet);
				}
				
				bullets = new Array();	
					
					
				stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
				stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
				this.addEventListener(Event.ENTER_FRAME, loop);
		
		
			
		}
		
		private function createBullet(e:ShootEvent):void
		{
			var shooter:BaseTank = e.shooter;
			
			var bullet:Bullet = new Bullet(shooter.x, shooter.y, shooter.turretRotation+shooter.rotation, shooter.turretLength);
			bullets.push(bullet);
			addChild(bullet);
			bullet.scaleX = bullet.scaleY = tank.scaleX;
			//bullet.x = tank.x;
			//bullet.y = tank.y;
			
			//bullets.push(new Bullet());
			//addChild(bullets[bullets.length-1]);
		}
		
		private function loop(e:Event):void
			
			//if (dPressed == true)
			//	{
			//	tank.x += 5;
			//	}
			tank.x += input.x * 5;
			//if (aPressed == true)
			//{
			//	tank.x -= 5;
			//}
			//if (wPressed == true)
			//{
			//	tank.y -= 5;
			//}
			tank.y += input.y * 5;
			//if (sPressed == true)
			//{
			//	tank.y += 5;
			//}
					
			
			
			for(var i:int = 0; i < bullets.length; i++ ) 
			{
				bullets[i].update();
			}
			
			
			
			
			
			//yas gebruik je de sin
			//xas gebruik je de cos
			
			tank.speed = input.y * 5;
			
			tank.rotation += input.x *5;
			
			tank.update();
			
			for(var j:int = 0; j < enemies.length; j++ )
			{
			enemies[j].update();
			}
			
			var diffX:Number = mouseX - tank.x;
			var diffY: Number = mouseY - tank.y;

		
		private function onKeyDown(e:KeyboardEvent):void
			{
				/*trace (e.keyCode); keycode opzoeken */
				if (e.keyCode == Keyboard.W)
				{
					//W is ingedrukt
					//wPressed = true;
					input.y = -1;
				
				}
				
				if (e.keyCode == Keyboard.A)
				{
					//aPressed = true;
					
					input.x = -1;
				}
				
				if (e.keyCode == Keyboard.S)
				{
					//sPressed = true;
					
					input.y = 1;
				}
				
				if (e.keyCode == Keyboard.D)
				{
					//dPressed = true;
					
					input.x = 1;
				}
				//andere knoppen
				
				
				
			}
		
		
		private function onKeyUp(e:KeyboardEvent):void
			{
				if (e.keyCode == Keyboard.W)
				{
					//W is losgelaten
					//wPressed = false;
					input.y = 0;
				}
				
				if (e.keyCode == Keyboard.A)
				{
					//aPressed = false;
					input.x = 0;
				}
				
				if (e.keyCode == Keyboard.S)
				{
					//sPressed = false;
					input.y = 0;
				}
				
				if (e.keyCode == Keyboard.D)
				{
					//dPressed = false;
					
					input.x = 0;
				}
				//andere knoppen
				
				
			}
		
		
		
		
		}
}
