package com.richardhoppes.moviedb.event.person {
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	/**
	 * Get Movie Version Event 
	 * @author richard hoppes
	 * 
	 */	
	public class GetPersonVersionEvent extends Event {
		
		public static const RESULT:String = "GetPersonVersionEvent.RESULT";
		public static const NO_RESULTS:String = "GetPersonVersionEvent.NO_RESULT";
		
		private var _results:ArrayCollection;
		
		public function get results():ArrayCollection {
			return _results;
		}
		
		private var _rawResult:String;
		
		public function get rawResult():String {
			return _rawResult;
		}
		
		public function GetPersonVersionEvent(type:String, results:ArrayCollection, rawResult:String, bubbles:Boolean = false) {
			super(type, bubbles);
			_results = results;
			_rawResult = rawResult;
		}
		
		override public function clone():Event {
			return new GetPersonVersionEvent(type, results, rawResult, bubbles);
		}
	}
}