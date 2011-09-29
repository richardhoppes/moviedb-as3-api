package com.richardhoppes.moviedb.event {
	import com.richardhoppes.moviedb.error.AuthError;
	
	import flash.events.Event;
	
	/**
	 * Auth Error Event 
	 * @author richard hoppes
	 * 
	 */	
	public class AuthErrorEvent extends Event {
		public static const NO_TOKEN_RECEIVED:String = "AuthErrorEvent.NO_TOKEN_RECEIVED";
		public static const TOKEN_REQUIRED:String = "AuthErrorEvent.TOKEN_REQUIRED";
		public static const UNKNOWN:String = "AuthErrorEvent.UNKNOWN";
		
		private var _error:AuthError;
		public function get error():AuthError {
			return _error;
		}
		
		private var _token:String;
		public function get token():String {
			return _token;
		}
		
		public function AuthErrorEvent(type:String, token:String, bubbles:Boolean = false) {
			super(type, bubbles);
			
			switch(type) {
				case NO_TOKEN_RECEIVED:
					_error = new AuthError("Error retrieving authentication token.", token);
					break;
				case TOKEN_REQUIRED:
					_error = new AuthError("Authentication token is required for this action.", token);
					break;
				default: 
					_error = new AuthError("Unknown error.", token);
					break;
			}
		}
		
		override public function clone():Event {
			return new AuthErrorEvent(type, token, bubbles);
		}
	}
}