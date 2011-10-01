package com.richardhoppes.moviedb.event.auth {
	import flash.events.Event;
	
	/**
	 * Get Session Event 
	 * @author richard hoppes
	 * 
	 */	
	public class GetSessionEvent extends Event {
		
		public static const SESSION_RECEIVED:String = "GetSessionEvent.SESSION_RECEIVED";
		
		private var _session:String;
		
		public function get session():String {
			return _session;
		}
		
		private var _username:String;
		
		public function get username():String {
			return _username;
		}
		
		private var _rawResult:String;
		
		public function get rawResult():String {
			return _rawResult;
		}
		
		public function GetSessionEvent(type:String, session:String, username:String, rawResult:String, bubbles:Boolean = false) {
			super(type, bubbles);
			_session = session;
			_username = username;
			_rawResult = rawResult;
		}
		
		override public function clone():Event {
			return new GetSessionEvent(type, session, username, rawResult, bubbles);
		}
	}
}