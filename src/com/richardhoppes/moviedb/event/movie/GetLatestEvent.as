package com.richardhoppes.moviedb.event.movie {
	import flash.events.Event;
	
	public class GetLatestEvent extends Event {
		
		public static const RESULT:String = "GetLatestEvent.RESULT";
		public static const NO_RESULTS:String = "GetLatestEvent.NO_RESULT";
		
		private var _results:Array;
		
		public function get results():Array {
			return _results;
		}
		
		private var _rawResult:String;
		
		public function get rawResult():String {
			return _rawResult;
		}
		
		public function GetLatestEvent(type:String, results:Array, rawResult:String, bubbles:Boolean = false) {
			super(type, bubbles);
			_results = results;
			_rawResult = rawResult;
		}
		
		override public function clone():Event {
			return new GetLatestEvent(type, results, rawResult, bubbles);
		}
	}
}