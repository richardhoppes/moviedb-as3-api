package com.richardhoppes.moviedb.event.person {
	import com.richardhoppes.moviedb.vo.PersonInfoVO;
	
	import flash.events.Event;
	
	/**
	 * Get Movie Info Event 
	 * @author richard hoppes
	 * 
	 */	
	public class GetPersonInfoEvent extends Event {
		
		public static const RESULT:String = "GetPersonInfoEvent.RESULT";
		public static const NO_RESULTS:String = "GetPersonInfoEvent.NO_RESULT";
		
		private var _result:PersonInfoVO;
		
		public function get result():PersonInfoVO {
			return _result;
		}
		
		private var _rawResult:String;
		
		public function get rawResult():String {
			return _rawResult;
		}
		
		public function GetPersonInfoEvent(type:String, result:PersonInfoVO, rawResult:String, bubbles:Boolean = false) {
			super(type, bubbles);
			_result = result;
			_rawResult = rawResult;
		}
		
		override public function clone():Event {
			return new GetPersonInfoEvent(type, result, rawResult, bubbles);
		}
	}
}