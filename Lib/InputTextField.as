package Lib
{
	
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.text.Font;
	import flash.geom.Rectangle;
	import flash.display.Shape;
	
	public class InputTextField extends Sprite 
	//Class to model an input text field which can only take in numbers.
	{
		
		private var inputField:TextField = new TextField();
		private var font1:Font2 = new Font2();
		private var myFormat:TextFormat = new TextFormat();
		
		/*Initializes this input text field with input width, height, font size, and initial text.
		*/
		public function init( w:int, h:int, size:int, initText:String )
        {
             
            var rectangle:Shape = new Shape();
            rectangle.graphics.beginFill( 0xFFFFFF );
            rectangle.graphics.drawRect( -w/2, -h/2, w, h );
            rectangle.graphics.endFill();
            addChild( rectangle );
             
            inputField.border = true;
            inputField.width = w;
            inputField.height = h;
            inputField.x -= w/2;
            inputField.y -= h/2;
            inputField.type = "input";
             
            myFormat.size = size;
            myFormat.align = TextFormatAlign.CENTER;
            myFormat.font = font1.fontName;
             
            inputField.defaultTextFormat = myFormat;
            inputField.restrict = "0-9.";
             
            inputField.text = initText;
             
            addChild( inputField );
             
        }

        /*Changes text in this text field to input String
        */
        public function changeText( txt:String ): void
        {
             
            inputField.text = txt;
             
        }
		
		/*Returns the number currently entered in text field.
		*/
		public function retriNum(): Number
		{
			
			if( inputField.text != null )
			{
				return Number( inputField.text );
			}
			else
			{
				return 0;
			}
			
		}

	}
	
}
