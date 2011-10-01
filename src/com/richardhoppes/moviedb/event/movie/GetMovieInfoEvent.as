package com.richardhoppes.moviedb.event.movie {
	import com.richardhoppes.moviedb.vo.MovieInfoVO;
	
	import flash.events.Event;
	
	/**
	 * Get Movie Info Event 
	 * @author richard hoppes
	 * 
	 */	
	public class GetMovieInfoEvent extends Event {
		
		public static const RESULT:String = "GetMovieInfoEvent.RESULT";
		public static const NO_RESULTS:String = "GetMovieInfoEvent.NO_RESULT";
		
		private var _result:MovieInfoVO;
		
		public function get result():MovieInfoVO {
			return _result;
		}
		
		private var _rawResult:String;
		
		public function get rawResult():String {
			return _rawResult;
		}
		
		public function GetMovieInfoEvent(type:String, result:MovieInfoVO, rawResult:String, bubbles:Boolean = false) {
			super(type, bubbles);
			_result = result;
			_rawResult = rawResult;
		}
		
		override public function clone():Event {
			return new GetMovieInfoEvent(type, result, rawResult, bubbles);
		}
	}
}