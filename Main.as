package 
{

	import flash.display.Sprite

	import Lib.*;
	
	public class Main extends Sprite
	//Class to serve as the main program, in which draws the approximate locus of points based on the position of a focus from a fixed directrix, and an input eccentricity
	{

		private const PI:Number = Math.PI;										//Pi
		
		private var eccentricity:Number = 0;									//current eccentricity of [locus]
		private var eUpperBound:Number;											//upper bound of eccentricity animation
		private var eLowerBound:Number;											//lower bound of eccentricity animation
		
		private var animate:Boolean = false;									//boolean flag indicating whether the user has selected the eccentricity to be animated
		private var beingClicked:Boolean = false;								//boolean flag indicating whether [focus] is being clicked on
		private var beingMoved:Boolean = true;									//boolean flag indicating whether [focus] is being moved by the mouse
		
		private var eIncrement = 0.05;											//[eccentricity] framely increment

		private var focus:Sprite = new Sprite();								//focus point
		private var directrix:Sprite = new Sprite();							//directrix line
		private var locus:Sprite = new Sprite();								//approximate locus of points produced from [focus], [directrix], and currently input eccentricity

		private var inputEcc:InputTextField = new InputTextField();				//InputTextField object to input [eccentricity]
		private var inputELB:InputTextField = new InputTextField();				//InputTextField object to input [eUpperBound]
		private var inputEUB:InputTextField = new InputTextField();				//InputTextField object to input [eLowerBound]
		
		private var inputEccM:Message = new Message();							//Message object to accompany [inputEcc]
		private var inputELBM:Message = new Message();							//Message object to accompany [inputELB]
		private var inputEUBM:Message = new Message();							//Message object to accompany [inputEUB]
		
		private var directrixLabel:Message = new Message();						//Message object to label [directrix]

		private var player:Player = new Player();								//pause/play button

		/*Initializes assets and adds them to stage
		*/
		public function Main()
		{

			focus.graphics.beginFill( 0 );
			focus.graphics.drawCircle( 0, 0, 5 );
			focus.graphics.endFill();
			focus.x = stage.stageWidth / 2;
			focus.y = stage.stageHeight / 2 - 20;
			addChild( focus );
			
			directrix.graphics.beginFill( 0x999999 );
			directrix.graphics.drawRect( -400, -1, 800, 2 );
			directrix.graphics.endFill();
			directrix.x = stage.stageWidth / 2;
			directrix.y = stage.stageHeight / 2 + 80;
			addChild( directrix );
			
			directrixLabel.init( 80, 25, 15, "Directrix", 0x999999, 1, true );
			directrixLabel.x = 40;
			directrixLabel.y = directrix.y - 12;
			addChild( directrixLabel );
			
			inputEcc.init( 40, 25, 16, "1" );
			inputEcc.x = 650;
			inputEcc.y = 35;
			addChild( inputEcc );
			
			inputELB.init( 40, 25, 16, "0.5" );
			inputELB.x = 330;
			inputELB.y = 50;
			addChild( inputELB );
			
			inputEUB.init( 40, 25, 16, "2" );
			inputEUB.x = 330;
			inputEUB.y = 20;
			addChild( inputEUB );
			
			player.init();
			player.x = 412;
			player.y = 50;
			addChild( player );
			
			inputEccM.init( 200, 25, 15, "Current Eccentricity:", 0, 1, true );
			inputEccM.x = 530;
			inputEccM.y = 35;
			addChild( inputEccM );
			
			inputELBM.init( 300, 20, 12, "Eccentricity Animation Lower Bound:", 0, 1, true );
			inputELBM.x = 180;
			inputELBM.y = 50;
			addChild( inputELBM );
			
			inputEUBM.init( 300, 20, 12, "Eccentricity Animation Upper Bound:", 0, 1, true );
			inputEUBM.x = 180;
			inputEUBM.y = 20;
			addChild( inputEUBM );
			
			addChild( locus );
			setChildIndex( locus, 0 );

		}

	}
	
}
