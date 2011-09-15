package com.richardhoppes.moviedb.event.movie {
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class MovieSearchEvent extends Event {
		
		public static const RESULT:String = "MovieSearchEvent.RESULT";
		public static const NO_RESULTS:String = "MovieSearchEvent.NO_RESULTS";
		
		private var _results:ArrayCollection;
		
		public function get results():ArrayCollection {
			return _results;
		}
		
		private var _rawResult:String;
		
		public function get rawResult():String {
			return _rawResult;
		}
		
		public function MovieSearchEvent(type:String, results:ArrayCollection, rawResult:String, bubbles:Boolean = false) {
			super(type, bubbles);
			_results = results;
			_rawResult = rawResult;
		}
		
		override public function clone():Event {
			return new MovieSearchEvent(type, results, rawResult, bubbles);
		}
	}
}