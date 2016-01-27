package 
{

	import flash.display.Sprite

	import Lib.*;
	
	public class Main extends Sprite
	//Class to serve as the main program, in which draws the approximate locus of points based on the position of a focus from a fixed directrix, and an input eccentricity
	{

		private var inputEcc:InputTextField = new InputTextField();						//InputTextField object to input [eccentricity]
		private var inputELB:InputTextField = new InputTextField();						//InputTextField object to input [eUpperBound]
		private var inputEUB:InputTextField = new InputTextField();						//InputTextField object to input [eLowerBound]
		
		private var inputEccM:Message = new Message();									//Message object to accompany [inputEcc]
		private var inputELBM:Message = new Message();									//Message object to accompany [inputELB]
		private var inputEUBM:Message = new Message();									//Message object to accompany [inputEUB]
		
		private var directrixLabel:Message = new Message();								//Message object to label [directrix]

		private var player:Player = new Player();										//pause/play button

		/*Initializes assets and adds them to stage
		*/
		public function Main() {

			directrixLabel.init( 80, 25, 15, "Directrix", 0x999999, 1, true );
			directrixLabel.x = 40;
			directrixLabel.y = stage.stageHeight / 2 + 80 - 12;
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
		}

	}
	
}
