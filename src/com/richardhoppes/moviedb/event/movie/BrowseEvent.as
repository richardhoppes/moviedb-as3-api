package com.richardhoppes.moviedb.event.movie {
	import flash.events.Event;
	
	/**
	 * Browse Event 
	 * @author richard hoppes
	 * 
	 */	
	public class BrowseEvent extends Event {
		
		public static const RESULT:String = "BrowseEvent.RESULT";
		public static const NO_RESULTS:String = "BrowseEvent.NO_RESULT";
		
		private var _results:Array;
		
		public function get results():Array {
			return _results;
		}
		
		private var _rawResult:String;
		
		public function get rawResult():String {
			return _rawResult;
		}
		
		public function BrowseEvent(type:String, results:Array, rawResult:String, bubbles:Boolean = false) {
			super(type, bubbles);
			_results = results;
			_rawResult = rawResult;
		}
		
		override public function clone():Event {
			return new BrowseEvent(type, results, rawResult, bubbles);
		}
	}
}