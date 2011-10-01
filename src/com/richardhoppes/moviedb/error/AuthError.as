package com.richardhoppes.moviedb.error {
	
	/**
	 * Auth Error 
	 * @author richard hoppes
	 * 
	 */	
	public class AuthError extends Error {
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
		
		public function AuthError(message:String, token:String = null, username:String = null, session:String = null, id:*=0) {
			super(message, id);
			_token = token;
			_username = username;
			_session = session;
		}
	}
}