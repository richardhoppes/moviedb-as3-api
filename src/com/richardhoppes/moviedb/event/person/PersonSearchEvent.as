package com.richardhoppes.moviedb.event.person {
	import com.richardhoppes.moviedb.vo.PersonSearchVO;
	
	import flash.events.Event;

	/**
	 * Movie Search Event 
	 * @author richard hoppes
	 * 
	 */	
	public class PersonSearchEvent extends Event {
		
		public static const RESULT:String = "PersonSearchEvent.RESULT";
		public static const NO_RESULTS:String = "PersonSearchEvent.NO_RESULTS";
		
		private var _results:Vector.<PersonSearchVO>;
		
		public function get results():Vector.<PersonSearchVO> {
			return _results;
		}
		
		private var _rawResult:String;
		
		public function get rawResult():String {
			return _rawResult;
		}
		
		public function PersonSearchEvent(type:String, results:Vector.<PersonSearchVO>, rawResult:String, bubbles:Boolean = false) {
			super(type, bubbles);
			_results = results;
			_rawResult = rawResult;
		}
		
		override public function clone():Event {
			return new PersonSearchEvent(type, results, rawResult, bubbles);
		}
	}
}