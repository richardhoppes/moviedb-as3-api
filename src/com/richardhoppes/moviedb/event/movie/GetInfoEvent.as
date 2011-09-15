package com.richardhoppes.moviedb.event.movie {
	import flash.events.Event;
	
	public class GetInfoEvent extends Event {
		
		public static const RESULT:String = "GetInfoEvent.RESULT";
		public static const NO_RESULTS:String = "GetInfoEvent.NO_RESULT";
		
		private var _results:Array;
		
		public function get results():Array {
			return _results;
		}
		
		private var _rawResult:String;
		
		public function get rawResult():String {
			return _rawResult;
		}
		
		public function GetInfoEvent(type:String, results:Array, rawResult:String, bubbles:Boolean = false) {
			super(type, bubbles);
			_results = results;
			_rawResult = rawResult;
		}
		
		override public function clone():Event {
			return new GetInfoEvent(type, results, rawResult, bubbles);
		}
	}
}