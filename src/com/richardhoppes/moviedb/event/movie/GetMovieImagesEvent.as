package com.richardhoppes.moviedb.event.movie {
	import com.richardhoppes.moviedb.vo.ImageVO;
	
	import flash.events.Event;
	
	/**
	 * Get Movie Images Event 
	 * @author richard hoppes
	 * 
	 */	
	public class GetMovieImagesEvent extends Event {
		
		public static const RESULT:String = "GetMovieImagesEvent.RESULT";
		public static const NO_RESULTS:String = "GetMovieImagesEvent.NO_RESULT";
		
		private var _results:Vector.<ImageVO>;
		
		public function get results():Vector.<ImageVO> {
			return _results;
		}
		
		private var _rawResult:String;
		
		public function get rawResult():String {
			return _rawResult;
		}
		
		public function GetMovieImagesEvent(type:String, results:Vector.<ImageVO>, rawResult:String, bubbles:Boolean = false) {
			super(type, bubbles);
			_results = results;
			_rawResult = rawResult;
		}
		
		override public function clone():Event {
			return new GetMovieImagesEvent(type, results, rawResult, bubbles);
		}
	}
}