package Libs 
{
	
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.text.TextFieldAutoSize;
	import flash.text.Font;
	
	public class Message extends Sprite 
	//Class to model a text message
	{
		
		var txt:TextField = new TextField();
		var font1:Font1 = new Font1();
		var font2:Font2 = new Font2();
		var myFormat:TextFormat = new TextFormat();
		
		var myFormatP:TextFormat = new TextFormat();
		
		var wP:int;
		var hP:int;
		var sizeP:int;
		var inTextP:String;
		var colP:Number;
		var fontP:int;
		var centerAP:Boolean;
		
		public function Create( w:int, h:int, size:int, inText:String, col:Number, font:int, centerA:Boolean )
		{
			
			wP = w;
			hP = h;
			sizeP = size;
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
		
		public function changeText( s:String ): void
		{
			
			txt.text = s;
			
		}
		
		public function changeSize( s:int ): void
		{
			
			myFormat.size = s;
			
			txt.defaultTextFormat = myFormat;
			
		}
		
		public function changeColor( c:Number ): void
		{
			
			myFormat.color = c;
			
			txt.defaultTextFormat = myFormat;
			
		}
		
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
		
		public function retText(): String
		{
			
			return txt.text;
			
		}
		
		public function getFormat(): TextFormat
		{
			
			return myFormat;
			
		}
		
	}
	
}
