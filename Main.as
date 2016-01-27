package 
{

	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.Event;

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

			//add event listeners to [focus] and the stage
			focus.addEventListener( MouseEvent.MOUSE_DOWN, focusClickDown );
			focus.addEventListener( MouseEvent.MOUSE_UP, focusClickUp );
			stage.addEventListener( MouseEvent.MOUSE_MOVE, focusClickMove );
			stage.addEventListener( Event.ENTER_FRAME, update );

		}

		/*Function to update [locus] if user has changed input eccentricity or [beingMoved] == true or [animate] == true
		*/
		private function update( event:Event ): void
		{
			
			animate = player.getAnim();
			
			//user has changed input eccentricity or [locus] is being moved or the user has selected the eccentricity to be animated
			if( eccentricity != inputEcc.retriNum() || beingMoved || animate )
			{
				var curRadius:Number;		//current pixel radius of circle drawn with [locus] at center to calculate points on that circle that would be valid points in [locus]
				var distance:Number;		//pixel distance from directrix a point on the circle with center at [locus] and radius [curRadius] would have to be to be a valid point in [locus]
				var len:Number;				//pixel distance between directrix and focus
				
				//user has selected eccentricity to be animated
				if( animate )																				
				{
					//animate [eccentricity]
					if( eccentricity >= inputEUB.retriNum() )												
					{
						eIncrement = -0.05;
					}
					else if( eccentricity <= inputELB.retriNum() )
					{
						eIncrement = 0.05;
					}
					eccentricity += eIncrement;
					inputEcc.changeText( "" + eccentricity.toFixed( 2 ) );
				}
				//user has not selected eccentricity to be animated
				else																						
				{
					eccentricity = inputEcc.retriNum();
				}
								
				//clear [locus] if necessary																			
				if( locus.numChildren > 0 )																	
				{
					locus.removeChildren( 0, locus.numChildren - 1 );
				}
														
				//for-loop adding points to [locus] in each iteration													
				for( curRadius = 1; curRadius < 400; curRadius += 0.4 )
				{
					var p1:Sprite = new Sprite();		//point to be added to [locus]
					var p2:Sprite = new Sprite();		//point to be added to [locus]
					var ratio:Number;					//Opposite side pixel length over hypotenuse pixel length of right triangle produced by [directrix], [focus], and a current
														//    valid point on [locus] in this loop iteration
					
					//initialize [p1] and [p2]
					p1.graphics.beginFill( 0x888888 );														
					p1.graphics.drawCircle( 0, 0, 5 );
					p1.graphics.endFill();
					p2.graphics.beginFill( 0x888888 );														
					p2.graphics.drawCircle( 0, 0, 5 );
					p2.graphics.endFill();
					
					distance = curRadius / eccentricity;
					len = Math.abs( directrix.y - focus.y );
					ratio = ( distance - len ) / curRadius;
					if( directrix.y > focus.y )
					{
						ratio = ratio * -1;
					}
					
					//[ratio] is produced from a valid angle
					if( Math.abs( ratio ) <= 1 )															
					{
						//correctly place and add [p1] to [locus]
						p1.x = focus.x + curRadius * Math.cos( Math.asin( ratio ) );						
						p1.y = focus.y + curRadius * ratio;
						locus.addChild( p1 );
						
						//correctly place and add [p2] to [locus]
						p2.x = focus.x + curRadius * Math.cos( PI - Math.asin( ratio ) );
						p2.y = focus.y + curRadius * ratio;
						locus.addChild( p2 );
					}
				}
			}
			
			beingMoved = false;
			
		}

		/*Function to execute when a mouse down action occurs on [focus] to update [beingClicked]
		*/
		private function focusClickDown( event:MouseEvent ): void
		{
			
			beingClicked = true;
			
		}
		
		/*Function to execute when a mouse up action occurs on [focus] to update [beingClicked]
		*/
		private function focusClickUp( event:MouseEvent ): void
		{
			
			beingClicked = false;
			
		}
		
		/*Function to execute when a mouse moving action occurs on [focus] to make [focus] follow mouse if [beingClicked] == true and also update [beingMoved]
		*/
		private function focusClickMove( event:MouseEvent ): void
		{
			
			/*Make focus follow mouse if it is being clicked
			*/
			if( beingClicked )
			{
				focus.x = mouseX;
				focus.y = mouseY;
				
				beingMoved = true;
			}
			
		}

	}
	
}
