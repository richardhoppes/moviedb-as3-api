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
		public static const NO_SESSION_RECEIVED:String = "AuthErrorEvent.NO_SESSION_RECEIVED";
		
		private var _error:AuthError;
		public function get error():AuthError {
			return _error;
		}
		
		private var _token:String;
		public function get token():String {
			return _token;
		}
		
		private var _username:String;
		public function get username():String {
			return _username;
		}
		
		private var _session:String;
		public function get session():String {
			return _session;
		}
		
		public function AuthErrorEvent(type:String, token:String = null, username:String = null, session:String = null, bubbles:Boolean = false) {
			super(type, bubbles);
			
			switch(type) {
				case NO_TOKEN_RECEIVED:
					_error = new AuthError("Error retrieving authentication token.", token, username, session);
					break;
				case TOKEN_REQUIRED:
					_error = new AuthError("Authentication token is required for this action.", token, username, session);
					break;
				case NO_SESSION_RECEIVED: 
					_error = new AuthError("Error retrieving session.", token, username, session);
					break;
				default: 
					_error = new AuthError("Unknown error.", token, username, session);
					break;
			}
		}
		
		override public function clone():Event {
			return new AuthErrorEvent(type, token, username, session, bubbles);
		}
	}
}