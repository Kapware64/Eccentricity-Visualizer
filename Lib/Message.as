package Libs 
{
	
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.text.TextFieldAutoSize;
	import flash.text.Font;
	
	public class Message extends Sprite 
	//Class to model a box of text
	{
		
		var txt:TextField = new TextField();
		var font1:Font1 = new Font1();
		var font2:Font2 = new Font2();
		var myFormat:TextFormat = new TextFormat();
		
		var myFormatP:TextFormat = new TextFormat();
		
		var wP:int;
		var hP:int;
		var inTextP:String;
		var colP:Number;
		var fontP:int;
		var centerAP:Boolean;
		
		/*Initializes this box of text with an input width, height, font size, initial text, number of columns,
		font selection (font 1 or 2), and whether text is aligned center (true) or left (false)
		*/
		public function init( w:int, h:int, size:int, inText:String, col:Number, font:int, centerA:Boolean )
		{
			
			wP = w;
			hP = h;
			inTextP = inText;
			colP = col;
			fontP = font;
			centerAP = centerA;
			
			txt.width = w;
			txt.height = h;
			txt.x -= w/2;
			txt.y -= h/2;
			
			myFormat.size = size;
			
			if( centerA )
			{
				myFormat.align = TextFormatAlign.CENTER;
			}
			else
			{
				myFormat.align = TextFormatAlign.LEFT;
			}
			
			if( font == 1 )
			{
				myFormat.font = font1.fontName;
			}
			else if( font == 2 )
			{
				myFormat.font = font2.fontName;
				myFormat.bold = true;
			}
			
			txt.defaultTextFormat = myFormat;
			
			txt.multiline = true;
			txt.wordWrap = true;
			
			txt.textColor = col;
			txt.text = inText;
			txt.selectable = false;
			
			txt.multiline = true;
			
			addChild( txt );
			
			myFormatP = myFormat;
			
		}
		
		/*Changes text in this text box
		*/
		public function changeText( s:String ): void
		{
			
			txt.text = s;
			
		}
		
		/*Changes font size of text in this text box
		*/
		public function changeSize( s:int ): void
		{
			
			myFormat.size = s;
			
			txt.defaultTextFormat = myFormat;
			
		}
		
		/*Changes color of this text box
		*/
		public function changeColor( c:Number ): void
		{
			
			myFormat.color = c;
			
			txt.defaultTextFormat = myFormat;
			
		}
		
		/*Chnages formatting of this text box back to default
		*/
		public function changeDefault(): void
		{
			
			txt.width = wP;
			txt.height = hP;
			txt.x -= wP/2;
			txt.y -= hP/2;
			
			txt.defaultTextFormat = myFormat;
			
			txt.multiline = true;
			txt.wordWrap = true;
			
			txt.textColor = colP;
			txt.text = inTextP;
			txt.selectable = false;
			
			txt.multiline = true;
			
		}
		
		/*Returns text in text box
		*/
		public function retText(): String
		{
			
			return txt.text;
			
		}
		
		/*Gets format of text in this text box
		*/
		public function getFormat(): TextFormat
		{
			
			return myFormat;
			
		}
		
	}
	
}
