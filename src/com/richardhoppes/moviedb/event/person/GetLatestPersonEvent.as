package com.richardhoppes.moviedb.event.person {
	import com.richardhoppes.moviedb.vo.PersonLatestVO;
	
	import flash.events.Event;
	
	/**
	 * Get Latest Movie Event 
	 * @author richard hoppes
	 * 
	 */	
	public class GetLatestPersonEvent extends Event {
		
		public static const RESULT:String = "GetLatestPersonEvent.RESULT";
		public static const NO_RESULTS:String = "GetLatestPersonEvent.NO_RESULT";
		
		private var _result:PersonLatestVO;
		
		public function get result():PersonLatestVO {
			return _result;
		}
		
		private var _rawResult:String;
		
		public function get rawResult():String {
			return _rawResult;
		}
		
		public function GetLatestPersonEvent(type:String, result:PersonLatestVO, rawResult:String, bubbles:Boolean = false) {
			super(type, bubbles);
			_result = result;
			_rawResult = rawResult;
		}
		
		override public function clone():Event {
			return new GetLatestPersonEvent(type, result, rawResult, bubbles);
		}
	}
}