package com.richardhoppes.moviedb.event.movie {
	import com.richardhoppes.moviedb.vo.MovieSearchVO;
	
	import flash.events.Event;
	
	/**
	 * Movie Search Event 
	 * @author richard hoppes
	 * 
	 */	
	public class MovieSearchEvent extends Event {
		
		public static const RESULT:String = "MovieSearchEvent.RESULT";
		public static const NO_RESULTS:String = "MovieSearchEvent.NO_RESULTS";
		
		private var _results:Vector.<MovieSearchVO>;
		
		public function get results():Vector.<MovieSearchVO> {
			return _results;
		}
		
		private var _rawResult:String;
		
		public function get rawResult():String {
			return _rawResult;
		}
		
		public function MovieSearchEvent(type:String, results:Vector.<MovieSearchVO>, rawResult:String, bubbles:Boolean = false) {
			super(type, bubbles);
			_results = results;
			_rawResult = rawResult;
		}
		
		override public function clone():Event {
			return new MovieSearchEvent(type, results, rawResult, bubbles);
		}
	}
}