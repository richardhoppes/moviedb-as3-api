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
	
	public class BaseService extends EventDispatcher {
		protected const BASE_API_URL:String = "http://api.themoviedb.org/2.1/";
		
		protected const RESPONSE_FORMAT_XML:String = "xml";
		protected const RESPONSE_FORMAT_JSON:String = "json";
		protected const RESPONSE_FORMAT_YAML:String = "yaml";
		
		protected const API_RESPONSE_NO_RESULTS:String = "Nothing found.";
		
		public function BaseService() {
			super();
			_language = "en"; 
			_responseFormat = RESPONSE_FORMAT_JSON; 
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
		
		private var _responseFormat:String;
		public function set responseFormat(responseFormat:String):void {
			_responseFormat = responseFormat;
		}
		public function get responseFormat():String {
			return _responseFormat;
		}

		protected function loadURL(requestURL:String, resultHandler:Function, requestMethod:String = URLRequestMethod.GET):void {
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, resultHandler);
			loader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
		
			try {
				var request:URLRequest = new URLRequest(requestURL);
				request.method = requestMethod;
				loader.load(request);
			} catch (error:Error) {
				dispatchEvent(new ServiceErrorEvent(ServiceErrorEvent.FAULT, new ServiceError(error.message, error.errorID))); 
			}
		}
		
		protected function ioErrorHandler(event:IOErrorEvent):void {
			dispatchEvent(new ServiceErrorEvent(ServiceErrorEvent.IO_ERROR, new ServiceError(event.text, event.errorID))); 
		}
		
		protected function securityErrorHandler(event:SecurityErrorEvent):void {
			dispatchEvent(new ServiceErrorEvent(ServiceErrorEvent.SECURITY_ERROR, new ServiceError(event.text, event.errorID))); 
		}
		
		protected function buildURL(method:String, args:String):String {
			return BASE_API_URL + method + "/" + language + "/" + responseFormat + "/" + apiKey + "/" +args;
		}
		
		protected function parseResponse(response:String):Array {
			var results:Array = new Array();
			switch(responseFormat) {
				case RESPONSE_FORMAT_JSON:
					results = parseJSONResponse(response);
					break;
				case RESPONSE_FORMAT_XML:
					throw new Error("Feature not yet supported. :)");
					break;
				case RESPONSE_FORMAT_YAML: 
					throw new Error("Feature not yet supported. :)");
					break;
			}
			return results;
		}
		
		private function parseJSONResponse(response:String):Array {
			var results:Array = new Array();
			try {
				results = JSON.decode(response, true);
			} catch (error:JSONParseError) {
				trace("Log, but don't throw error");
				//dispatchEvent(new ServiceErrorEvent(ServiceErrorEvent.RESPONSE_PARSE_ERROR, new ServiceError(error.message, error.errorID)));
			} catch (error:Error) {
				trace("Log, but don't throw error");
				//dispatchEvent(new ServiceErrorEvent(ServiceErrorEvent.RESPONSE_PARSE_ERROR, new ServiceError(error.message, error.errorID)));
			}

			if (results.length == 1 && results[0] is String && results[0] == API_RESPONSE_NO_RESULTS) {
				results = new Array();
			} 
			return results;
		}
	}
}