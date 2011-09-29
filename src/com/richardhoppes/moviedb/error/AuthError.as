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
		
		public function AuthError(message:String, token:String, id:*=0) {
			super(message, id);
			_token = token;
		}
	}
}