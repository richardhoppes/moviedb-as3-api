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
		
		private var _results:LatestVO;
		
		public function get results():LatestVO {
			return _results;
		}
		
		private var _rawResult:String;
		
		public function get rawResult():String {
			return _rawResult;
		}
		
		public function GetLatestEvent(type:String, results:LatestVO, rawResult:String, bubbles:Boolean = false) {
			super(type, bubbles);
			_results = results;
			_rawResult = rawResult;
		}
		
		override public function clone():Event {
			return new GetLatestEvent(type, results, rawResult, bubbles);
		}
	}
}