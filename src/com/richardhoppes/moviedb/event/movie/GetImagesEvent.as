package com.richardhoppes.moviedb.event.movie {
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	/**
	 * Get Images Event 
	 * @author richard hoppes
	 * 
	 */	
	public class GetImagesEvent extends Event {
		
		public static const RESULT:String = "GetImagesEvent.RESULT";
		public static const NO_RESULTS:String = "GetImagesEvent.NO_RESULT";
		
		private var _results:ArrayCollection;
		
		public function get results():ArrayCollection {
			return _results;
		}
		
		private var _rawResult:String;
		
		public function get rawResult():String {
			return _rawResult;
		}
		
		public function GetImagesEvent(type:String, results:ArrayCollection, rawResult:String, bubbles:Boolean = false) {
			super(type, bubbles);
			_results = results;
			_rawResult = rawResult;
		}
		
		override public function clone():Event {
			return new GetImagesEvent(type, results, rawResult, bubbles);
		}
	}
}