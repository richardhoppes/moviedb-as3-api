package com.richardhoppes.moviedb.event.movie {
	import com.richardhoppes.moviedb.vo.MovieImdbLookupVO;
	
	import flash.events.Event;
	
	/**
	 * IMDB Movie Lookup Event 
	 * @author richard hoppes
	 * 
	 */	
	public class IMDBMovieLookupEvent extends Event {
		
		public static const RESULT:String = "IMDBMovieLookupEvent.RESULT";
		public static const NO_RESULTS:String = "IMDBMovieLookupEvent.NO_RESULT";
		
		private var _result:MovieImdbLookupVO;
		
		public function get result():MovieImdbLookupVO {
			return _result;
		}
		
		private var _rawResult:String;
		
		public function get rawResult():String {
			return _rawResult;
		}
		
		public function IMDBMovieLookupEvent(type:String, result:MovieImdbLookupVO, rawResult:String, bubbles:Boolean = false) {
			super(type, bubbles);
			_result = result;
			_rawResult = rawResult;
		}
		
		override public function clone():Event {
			return new IMDBMovieLookupEvent(type, result, rawResult, bubbles);
		}
	}
}