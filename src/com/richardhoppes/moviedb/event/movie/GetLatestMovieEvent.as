package com.richardhoppes.moviedb.event.movie {
	import com.richardhoppes.moviedb.vo.LatestMovieVO;
	
	import flash.events.Event;
	
	/**
	 * Get Latest Movie Event 
	 * @author richard hoppes
	 * 
	 */	
	public class GetLatestMovieEvent extends Event {
		
		public static const RESULT:String = "GetLatestMovieEvent.RESULT";
		public static const NO_RESULTS:String = "GetLatestMovieEvent.NO_RESULT";
		
		private var _result:LatestMovieVO;
		
		public function get result():LatestMovieVO {
			return _result;
		}
		
		private var _rawResult:String;
		
		public function get rawResult():String {
			return _rawResult;
		}
		
		public function GetLatestMovieEvent(type:String, result:LatestMovieVO, rawResult:String, bubbles:Boolean = false) {
			super(type, bubbles);
			_result = result;
			_rawResult = rawResult;
		}
		
		override public function clone():Event {
			return new GetLatestMovieEvent(type, result, rawResult, bubbles);
		}
	}
}