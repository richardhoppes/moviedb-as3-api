package com.richardhoppes.moviedb.event.movie {
	import flash.events.Event;
	
	public class IMDBLookupEvent extends Event {
		
		public static const RESULT:String = "IMDBLookupEvent.RESULT";
		public static const NO_RESULTS:String = "IMDBLookupEvent.NO_RESULT";
		
		private var _results:Array;
		
		public function get results():Array {
			return _results;
		}
		
		private var _rawResult:String;
		
		public function get rawResult():String {
			return _rawResult;
		}
		
		public function IMDBLookupEvent(type:String, results:Array, rawResult:String, bubbles:Boolean = false) {
			super(type, bubbles);
			_results = results;
			_rawResult = rawResult;
		}
		
		override public function clone():Event {
			return new IMDBLookupEvent(type, results, rawResult, bubbles);
		}
	}
}