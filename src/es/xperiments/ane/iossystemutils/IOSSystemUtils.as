package es.xperiments.ane.iossystemutils
{

	public class IOSSystemUtils
	{
		public function getBrightness():Number{	return 1; }
		[ANEmbed(arguments="brightness")]
		public function setBrightness(brightness:Number):void{}
		[ANEmbed(arguments="enabled")]
		public function setTorchEnabled(enabled:Boolean):void{}
		[ANEmbed(arguments="badgeCount")]
		public function setBadgeNumber(badgeCount:uint):void{}

	}
}
