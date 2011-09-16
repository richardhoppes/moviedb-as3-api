package com.richardhoppes.moviedb.event.movie {
	import com.richardhoppes.moviedb.vo.MovieInfoVO;
	
	import flash.events.Event;
	
	/**
	 * Get Info Event 
	 * @author richard hoppes
	 * 
	 */	
	public class GetInfoEvent extends Event {
		
		public static const RESULT:String = "GetInfoEvent.RESULT";
		public static const NO_RESULTS:String = "GetInfoEvent.NO_RESULT";
		
		private var _result:MovieInfoVO;
		
		public function get result():MovieInfoVO {
			return _result;
		}
		
		private var _rawResult:String;
		
		public function get rawResult():String {
			return _rawResult;
		}
		
		public function GetInfoEvent(type:String, result:MovieInfoVO, rawResult:String, bubbles:Boolean = false) {
			super(type, bubbles);
			_result = result;
			_rawResult = rawResult;
		}
		
		override public function clone():Event {
			return new GetInfoEvent(type, result, rawResult, bubbles);
		}
	}
}