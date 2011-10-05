package com.richardhoppes.moviedb.event.person {
	import com.richardhoppes.moviedb.vo.PersonVersionVO;
	
	import flash.events.Event;
	
	/**
	 * Get Movie Version Event 
	 * @author richard hoppes
	 * 
	 */	
	public class GetPersonVersionEvent extends Event {
		
		public static const RESULT:String = "GetPersonVersionEvent.RESULT";
		public static const NO_RESULTS:String = "GetPersonVersionEvent.NO_RESULT";
		
		private var _results:Vector.<PersonVersionVO>;
		
		public function get results():Vector.<PersonVersionVO> {
			return _results;
		}
		
		private var _rawResult:String;
		
		public function get rawResult():String {
			return _rawResult;
		}
		
		public function GetPersonVersionEvent(type:String, results:Vector.<PersonVersionVO>, rawResult:String, bubbles:Boolean = false) {
			super(type, bubbles);
			_results = results;
			_rawResult = rawResult;
		}
		
		override public function clone():Event {
			return new GetPersonVersionEvent(type, results, rawResult, bubbles);
		}
	}
}