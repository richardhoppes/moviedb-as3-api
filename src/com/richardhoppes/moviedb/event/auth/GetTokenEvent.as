package com.richardhoppes.moviedb.event.auth {
	import flash.events.Event;
	
	/**
	 * Get Token Event 
	 * @author richard hoppes
	 * 
	 */	
	public class GetTokenEvent extends Event {
		
		public static const TOKEN_RECEIVED:String = "GetTokenEvent.TOKEN_RECEIVED";
		
		private var _token:String;
		
		public function get token():String {
			return _token;
		}
		
		private var _rawResult:String;
		
		public function get rawResult():String {
			return _rawResult;
		}
		
		public function GetTokenEvent(type:String, token:String, rawResult:String, bubbles:Boolean = false) {
			super(type, bubbles);
			_token = token;
			_rawResult = rawResult;
		}
		
		override public function clone():Event {
			return new GetTokenEvent(type, token, rawResult, bubbles);
		}
	}
}