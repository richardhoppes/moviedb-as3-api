package com.richardhoppes.moviedb.service {	
	import com.adobe.serialization.json.JSON;
	import com.adobe.serialization.json.JSONParseError;
	import com.richardhoppes.moviedb.error.ServiceError;
	import com.richardhoppes.moviedb.event.movie.ServiceErrorEvent;
	
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
	
	/**
	 * Base Service 
	 * @author richard hoppes
	 * 
	 */	
	public class BaseService extends EventDispatcher {
		protected const BASE_API_URL:String = "http://api.themoviedb.org/2.1/";
		
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
		
		protected function buildURL(method:String, args:String = null, trailingSlash:Boolean = true):String {
			var url:String = BASE_API_URL + method + "/" + language + "/json/" + apiKey;
			if(args != null) {
				if(trailingSlash)
					url += "/" + args;
				else
					url += args;
			}
			return url;
		}
	}
}