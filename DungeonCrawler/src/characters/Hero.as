/**
 * User: John Lindquist
 * Date: 2/16/11
 * Time: 1:02 AM
 */
package characters
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;

	public class Hero extends Sprite implements Allowable
	{
		private var _ascii:String;
		private var _graphic:Bitmap;
		
		public function Hero(ascii:String, size:int)
		{
			this._ascii = ascii;

			var textField:TextField = new TextField();
			textField.text = ascii;
			textField.setTextFormat(new TextFormat("Lucida Console", size, 0x00ff00));

			var bitmapData:BitmapData;

			bitmapData = new BitmapData(size, size, true, 0x00000000);
			bitmapData.draw(textField);

			_graphic = new Bitmap(bitmapData);

			addChild(_graphic);
		}

		public function allow():void
		{
		}

		public function deny():void
		{
		}
	}
}