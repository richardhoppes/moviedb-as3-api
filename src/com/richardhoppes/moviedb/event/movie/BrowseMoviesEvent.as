package com.richardhoppes.moviedb.event.movie {
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	/**
	 * Browse Movies Event 
	 * @author richard hoppes
	 * 
	 */	
	public class BrowseMoviesEvent extends Event {
		
		public static const RESULT:String = "BrowseMoviesEvent.RESULT";
		public static const NO_RESULTS:String = "BrowseMoviesEvent.NO_RESULT";
		
		private var _results:ArrayCollection;
		
		public function get results():ArrayCollection {
			return _results;
		}
		
		private var _rawResult:String;
		
		public function get rawResult():String {
			return _rawResult;
		}
		
		public function BrowseMoviesEvent(type:String, results:ArrayCollection, rawResult:String, bubbles:Boolean = false) {
			super(type, bubbles);
			_results = results;
			_rawResult = rawResult;
		}
		
		override public function clone():Event {
			return new BrowseMoviesEvent(type, results, rawResult, bubbles);
		}
	}
}