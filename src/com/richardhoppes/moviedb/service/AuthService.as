package com.richardhoppes.moviedb.service {
	import com.richardhoppes.moviedb.event.AuthErrorEvent;
	import com.richardhoppes.moviedb.event.auth.GetTokenEvent;
	import com.richardhoppes.moviedb.json.ParseUtil;
	import com.richardhoppes.moviedb.json.ResponseUtil;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	/**
	 * Auth Service
	 * @author richard hoppes
	 * 
	 */	
	public class AuthService extends BaseService {
		public const AUTH_GET_TOKEN_METHOD:String = "Auth.getToken";
		public const AUTH_GET_SESSION_METHOD:String = "Auth.getSession";

		public function AuthService() {
			super();
		}
		
		public function getToken():void {
			loadURL(buildAuthURL(AUTH_GET_TOKEN_METHOD), getToken_ResultHandler);
		}

		private function getToken_ResultHandler(e:Event):void {
			var jsonResult:Object = ParseUtil.decodeAsObject(e.currentTarget.data as String); 
			if(jsonResult.token != null) {
				dispatchEvent(new GetTokenEvent(GetTokenEvent.TOKEN_RECEIVED, jsonResult.token, e.currentTarget.data as String));
			} else {
				trace(e.currentTarget.data as String);
				dispatchEvent(new AuthErrorEvent(AuthErrorEvent.NO_TOKEN_RECEIVED, null));
			}
		}
		
		public function getAuthURL(token:String):String {
			return "http://www.themoviedb.org/auth/" + token;
		}
		
		public function getSession(token:String):void {
			loadURL(buildAuthURL(AUTH_GET_SESSION_METHOD, token), getSession_ResultHandler);
		}
		
		protected function getSession_ResultHandler(e:Event):void {
			trace(e.currentTarget.data as String);
		}
	}
}