package com.richardhoppes.moviedb.service {
	import com.richardhoppes.moviedb.event.AuthErrorEvent;
	import com.richardhoppes.moviedb.event.auth.GetSessionEvent;
	import com.richardhoppes.moviedb.event.auth.GetTokenEvent;
	import com.richardhoppes.moviedb.util.json.ParseUtil;
	import com.richardhoppes.moviedb.util.json.MovieResponseUtil;
	
	import flash.events.Event;
	
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
		
		/**
		 * Retrieves authentication token 
		 * @return void 
		 */
		public function getToken():void {
			loadURL(buildAuthURL(AUTH_GET_TOKEN_METHOD), getToken_ResultHandler);
		}

		/**
		 * Handles getToken result
		 * @param e Event  
		 * @return void
		 */
		private function getToken_ResultHandler(e:Event):void {
			var jsonResult:Object = ParseUtil.decodeAsObject(e.currentTarget.data as String); 
			if(jsonResult.token != null) {
				dispatchEvent(new GetTokenEvent(GetTokenEvent.TOKEN_RECEIVED, jsonResult.token, e.currentTarget.data as String));
			} else {
				dispatchEvent(new AuthErrorEvent(AuthErrorEvent.NO_TOKEN_RECEIVED));
			}
		}
		
		/**
		 * Gets authentication url the user must visit to enter his/her username/password
		 * @param token String authentication token 
		 * @return void 
		 */
		public function getAuthURL(token:String):String {
			return BASE_AUTH_URL + token;
		}
		
		/**
		 * Retrieves session required for user to use write commands
		 * @param token String authentication token 
		 * @return void 
		 */
		public function getSession(token:String):void {
			loadURL(buildGetURL(AUTH_GET_SESSION_METHOD, token, false), getSession_ResultHandler);
		}
		
		/**
		 * Handles get session event
		 * @param e Event  
		 * @return void
		 */
		protected function getSession_ResultHandler(e:Event):void {
			var jsonResult:Object = ParseUtil.decodeAsObject(e.currentTarget.data as String);
			if(jsonResult.username != null && jsonResult.session != null) {
				dispatchEvent(new GetSessionEvent(GetSessionEvent.SESSION_RECEIVED, jsonResult.session, jsonResult.username, e.currentTarget.data as String));
			} else {
				dispatchEvent(new AuthErrorEvent(AuthErrorEvent.NO_SESSION_RECEIVED, null, jsonResult.username, jsonResult.session));
			}
		}
	}
}