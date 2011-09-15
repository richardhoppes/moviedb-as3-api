package com.richardhoppes.moviedb.event.movie {
	import com.richardhoppes.moviedb.error.ServiceError;
	
	import flash.events.Event;

	public class ServiceErrorEvent extends Event {
		
		public static const FAULT:String = "ServiceErrorEvent.FAULT";
		public static const IO_ERROR:String = "ServiceErrorEvent.IO_ERROR";
		public static const SECURITY_ERROR:String = "ServiceErrorEvent.SECURITY_ERROR";
		public static const RESPONSE_PARSE_ERROR:String = "ServiceErrorEvent.JSON_PARSE_ERROR";
		
		private var _error:ServiceError;
		
		public function get error():ServiceError {
			return _error;
		}
		
		public function ServiceErrorEvent(type:String, error:ServiceError, bubbles:Boolean = false) {
			super(type, bubbles);
			_error = error;
		}
		
		override public function clone():Event {
			return new ServiceErrorEvent(type, error, bubbles);
		}
	}
}