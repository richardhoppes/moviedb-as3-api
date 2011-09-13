package com.richardhoppes.moviedb.event {
	import flash.events.Event;
	
	public class GetVersionEvent extends Event {
		
		public static const RESULT:String = "GetVersionEvent.RESULT";
		public static const NO_RESULTS:String = "GetVersionEvent.NO_RESULT";
		
		private var _results:Array;
		
		public function get results():Array {
			return _results;
		}
		
		private var _rawResult:String;
		
		public function get rawResult():String {
			return _rawResult;
		}
		
		public function GetVersionEvent(type:String, results:Array, rawResult:String, bubbles:Boolean = false) {
			super(type, bubbles);
			_results = results;
			_rawResult = rawResult;
		}
		
		override public function clone():Event {
			return new GetVersionEvent(type, results, rawResult, bubbles);
		}
	}
}