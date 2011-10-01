package com.richardhoppes.moviedb.event.movie {
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	/**
	 * Get Movie Translations Event 
	 * @author richard hoppes
	 * 
	 */	
	public class GetMovieTranslationsEvent extends Event {
		
		public static const RESULT:String = "GetMovieTranslationsEvent.RESULT";
		public static const NO_RESULTS:String = "GetMovieTranslationsEvent.NO_RESULT";
		
		private var _results:ArrayCollection;
		
		public function get results():ArrayCollection {
			return _results;
		}
		
		private var _rawResult:String;
		
		public function get rawResult():String {
			return _rawResult;
		}
		
		public function GetMovieTranslationsEvent(type:String, results:ArrayCollection, rawResult:String, bubbles:Boolean = false) {
			super(type, bubbles);
			_results = results;
			_rawResult = rawResult;
		}
		
		override public function clone():Event {
			return new GetMovieTranslationsEvent(type, results, rawResult, bubbles);
		}
	}
}