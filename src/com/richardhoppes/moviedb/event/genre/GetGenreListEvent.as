package com.richardhoppes.moviedb.event.genre {
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	/**
	 * Get Genre List Event 
	 * @author richard hoppes
	 * 
	 */	
	public class GetGenreListEvent extends Event {
		
		public static const RESULT:String = "GetGenreListEvent.RESULT";
		public static const NO_RESULTS:String = "GetGenreListEvent.NO_RESULTS";
		
		private var _results:ArrayCollection;
		
		public function get results():ArrayCollection {
			return _results;
		}
		
		private var _rawResult:String;
		
		public function get rawResult():String {
			return _rawResult;
		}
		
		public function GetGenreListEvent(type:String, results:ArrayCollection, rawResult:String, bubbles:Boolean = false) {
			super(type, bubbles);
			_results = results;
			_rawResult = rawResult;
		}
		
		override public function clone():Event {
			return new GetGenreListEvent(type, results, rawResult, bubbles);
		}
	}
}