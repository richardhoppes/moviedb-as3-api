package com.richardhoppes.moviedb.event.movie {
	import com.richardhoppes.moviedb.vo.MovieVersionVO;
	
	import flash.events.Event;
	
	/**
	 * Get Movie Version Event 
	 * @author richard hoppes
	 * 
	 */	
	public class GetMovieVersionEvent extends Event {
		
		public static const RESULT:String = "GetMovieVersionEvent.RESULT";
		public static const NO_RESULTS:String = "GetMovieVersionEvent.NO_RESULT";
		
		private var _results:Vector.<MovieVersionVO>;
		
		public function get results():Vector.<MovieVersionVO> {
			return _results;
		}
		
		private var _rawResult:String;
		
		public function get rawResult():String {
			return _rawResult;
		}
		
		public function GetMovieVersionEvent(type:String, results:Vector.<MovieVersionVO>, rawResult:String, bubbles:Boolean = false) {
			super(type, bubbles);
			_results = results;
			_rawResult = rawResult;
		}
		
		override public function clone():Event {
			return new GetMovieVersionEvent(type, results, rawResult, bubbles);
		}
	}
}