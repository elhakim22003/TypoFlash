package com.flashdynamix.ui {	import flash.events.MouseEvent;		import com.flashdynamix.motion.Tweensy;	import com.flashdynamix.abstract.AbstractButton;		/**	 * @author FlashDynamix	 */	public class VideoControlButton extends AbstractButton {		public function VideoControlButton() {			super();						this.alpha = 0.2;		}		override protected function mouseOver(event : MouseEvent) : void {			Tweensy.to(this, {alpha:0.6});		}				override protected function mouseOut(event : MouseEvent) : void {			Tweensy.to(this, {alpha:0.2});		}	}}