/**
 * User: John Lindquist
 * Date: 1/3/11
 * Time: 6:24 PM
 */
package game
{
	import flash.events.EventDispatcher;

	public class BowlingFrame extends EventDispatcher
	{
		private var rules:FrameRules;
		private var frameBehavior:AddPinsBehavior;
		private var previousFrame:BowlingFrame;

		private var maxRollIndex:int;
		private var rollIndex:int = 0;
		
		internal var frameScore:int = 0;

		public function BowlingFrame(rules:FrameRules, maxRollIndex:int = 1)
		{
			this.rules = rules;
			this.maxRollIndex = maxRollIndex;
		}

		public function addPins(pins:int):void
		{
			frameScore += pins;
			frameBehavior = rules.determineBehavior(pins, frameScore);
			frameBehavior.addPins(this, pins);
		}

		public function addBonusPins(pins:int):void
		{
			frameBehavior.addBonusPins(pins);
		}

		public function addBonusPinsToPreviousFrame(pins:int):void
		{
			if (previousFrame)
			{
				previousFrame.addBonusPins(pins);
			}
		}

		public function setPreviousFrame(previousFrame:BowlingFrame):void
		{
			this.previousFrame = previousFrame;
		}

		public function getScore():int
		{
			return frameScore;
		}

		public function rollLimitReached():Boolean
		{
			return rollIndex == maxRollIndex;
		}

		public function nextRoll():void
		{
			rollIndex++;
		}
	}
}