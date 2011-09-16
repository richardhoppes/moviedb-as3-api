package com.richardhoppes.moviedb.event.movie {
	import com.richardhoppes.moviedb.vo.LatestVO;
	
	import flash.events.Event;
	
	/**
	 * Get Latest Event 
	 * @author richard hoppes
	 * 
	 */	
	public class GetLatestEvent extends Event {
		
		public static const RESULT:String = "GetLatestEvent.RESULT";
		public static const NO_RESULTS:String = "GetLatestEvent.NO_RESULT";
		
		private var _result:LatestVO;
		
		public function get result():LatestVO {
			return _result;
		}
		
		private var _rawResult:String;
		
		public function get rawResult():String {
			return _rawResult;
		}
		
		public function GetLatestEvent(type:String, result:LatestVO, rawResult:String, bubbles:Boolean = false) {
			super(type, bubbles);
			_result = result;
			_rawResult = rawResult;
		}
		
		override public function clone():Event {
			return new GetLatestEvent(type, result, rawResult, bubbles);
		}
	}
}