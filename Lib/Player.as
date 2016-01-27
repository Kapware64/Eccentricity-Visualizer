﻿package Libs 
{
    import flash.events.MouseEvent;
    import flash.display.Sprite;
    import flash.geom.Rectangle;
     
    public class Player extends Sprite
    //Class to model a pause/play button
    {
 
        private var playBtn:Play = new Play();
        private var stopBtn:Stop = new Stop();
        private var rect:Sprite = new Sprite();
     
        public function Player()
        {
             
            playBtn.x -= playBtn.width / 2;
            playBtn.y -= playBtn.height / 2;
            addChild( playBtn );
             
            stopBtn.x -= stopBtn.width / 2 + 5;
            stopBtn.y -= stopBtn.height / 2 + 7;
            addChild( stopBtn );
             
            stopBtn.visible = false;
             
            rect.graphics.beginFill( 0 );
            rect.graphics.drawRect( -40, -40, 40, 40 );
            rect.graphics.endFill();
            rect.alpha = 0;
            addChild( rect );
             
            rect.addEventListener( MouseEvent.MOUSE_OVER, mOver );
            rect.addEventListener( MouseEvent.MOUSE_OUT, mOut );
            rect.addEventListener( MouseEvent.CLICK, mClick );
             
        }
         
        private function mOver( event:MouseEvent ): void
        {
             
            if( stopBtn.visible )
            {
                stopBtn.alpha = 0.8;
            }
            else
            {
                playBtn.alpha = 0.8;
            }
             
        }
         
        private function mOut( event:MouseEvent ): void
        {
             
            if( stopBtn.visible )
            {
                stopBtn.alpha = 1;
            }
            else
            {
                playBtn.alpha = 1;
            }
             
        }
         
        private function mClick( event:MouseEvent ): void
        {
             
            if( stopBtn.visible )
            {
                stopBtn.visible = false;
                playBtn.visible = true;
            }
            else
            {
                stopBtn.visible = true;
                playBtn.visible = false;
            }
             
        }
         
        public function getAnim(): Boolean
        {
             
            if( stopBtn.visible )
            {
                return true;
            }
             
            return false;
             
        }
         
    }
     
}