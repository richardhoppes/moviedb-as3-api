package com.richardhoppes.moviedb.service {	
	import com.adobe.serialization.json.JSON;
	import com.adobe.serialization.json.JSONParseError;
	import com.richardhoppes.moviedb.error.ServiceError;
	import com.richardhoppes.moviedb.event.ServiceErrorEvent;
	
	import flash.errors.IOError;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	
	/**
	 * Base Service 
	 * @author richard hoppes
	 * 
	 */	
	public class BaseService extends EventDispatcher {
		protected const BASE_API_URL:String = "http://api.themoviedb.org/2.1/";
		protected const BASE_AUTH_URL:String = "http://www.themoviedb.org/auth/";
		
		
		public function BaseService() {
			super();
			_language = "en"; 
		}
		
		private var _apiKey:String;
		public function set apiKey(apiKey:String):void {
			_apiKey = apiKey;
		}
		public function get apiKey():String {
			return _apiKey;
		}
		
		private var _language:String;
		public function set language(language:String):void {
			_language = language;
		}
		public function get language():String {
			return _language;
		}
		
		/**
		 * Load URL
		 * @param e Event  
		 * @return void
		 */
		protected function loadURL(requestURL:String, resultHandler:Function, requestMethod:String = URLRequestMethod.GET, variables:URLVariables = null):void {
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, resultHandler);
			loader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
		
			try {
				var request:URLRequest = new URLRequest(requestURL);
				request.method = requestMethod;
				if(variables != null) {
					variables.api_key = apiKey;
					variables.type = "json";
					request.data = variables;
				}
				loader.load(request);
			} catch (error:Error) {
				dispatchEvent(new ServiceErrorEvent(ServiceErrorEvent.FAULT, new ServiceError(error.message, error.errorID))); 
			}
		}
		
		/**
		 * Handle IO error event 
		 * @param event IOErrorEvent
		 * @return void
		 */
		protected function ioErrorHandler(event:IOErrorEvent):void {
			dispatchEvent(new ServiceErrorEvent(ServiceErrorEvent.IO_ERROR, new ServiceError(event.text, event.errorID))); 
		}
		
		/**
		 * Handle security error event 
		 * @param event SecurityErrorEvent
		 * @return void
		 */
		protected function securityErrorHandler(event:SecurityErrorEvent):void {
			dispatchEvent(new ServiceErrorEvent(ServiceErrorEvent.SECURITY_ERROR, new ServiceError(event.text, event.errorID))); 
		}
		
		/**
		 * Build url for get requests  
		 * @param method String TMDb method that will be called
		 * @param args String query string that will be appended to the URL
		 * @param includeLanguage Boolean determines whether to specify language in the URL 
		 * @param includeFormat Boolean determines whether to specify return format in the URL 
		 * @return void
		 */
		protected function buildGetURL(method:String, args:String = null, includeLanguage:Boolean = true, includeFormat:Boolean = true):String {
			return buildRequestURL(method, args, includeLanguage, includeFormat ,true);
		}
		
		/**
		 * Build url for post requests  
		 * @param method String 
		 * @return void
		 */
		protected function buildPostURL(method:String):String {
			return buildRequestURL(method, null, false, false, false);
		}
		
		/**
		 * Build url user must follow to authenticate with their themoviedb.org username/password  
		 * @param method String 
		 * @param args String query string that will be appended to the URL
		 * @return void
		 */
		protected function buildAuthURL(method:String, args:String = null):String {
			var url:String = BASE_API_URL + method + "/json/" + apiKey;
			return appendArgs(url, args);
		}
		
		/**
		 * Build URL for all requests  
		 * @param method String TMDb method that will be called
		 * @param args String query string that will be appended to the URL
		 * @param includeLanguage Boolean determines whether to specify language in the URL 
		 * @param includeFormat Boolean determines whether to specify return format in the URL 
		 * @param includeApiKey Boolean determines whether to include the api key in the URL
		 * @return void
		 */
		private function buildRequestURL(method:String, args:String = null, includeLanguage:Boolean = true, includeFormat:Boolean = true, includeApiKey:Boolean = true):String {
			var url:String = BASE_API_URL + method;
			if(includeLanguage) {
				url += "/" + language;
			}
			if(includeFormat) {
				url += "/json";
			}
			if(includeApiKey) {
				url += "/" + apiKey;
			}
			return appendArgs(url, args);
		}
				
		/**
		 * Appends arguments to request url  
		 * @param method String TMDb method that will be called
		 * @param args String query string that will be appended to the URL
		 * @return void
		 */
		private function appendArgs(url:String, args:String):String {
			if(args != null) {
				if(args.charAt(0) == '?') 
					url += args;
				else
					url += "/" + args;
			}
			return url;
		}
	}
}