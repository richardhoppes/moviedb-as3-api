package com.richardhoppes.moviedb.event {
	import com.richardhoppes.moviedb.error.AuthError;
	import com.richardhoppes.moviedb.error.PostError;
	
	import flash.events.Event;
	
	/**
	 * Auth Error Event 
	 * @author richard hoppes
	 * 
	 */	
	public class PostErrorEvent extends Event {
		public static const MOVIE_RATING_ERROR:String = "PostErrorEvent.MOVIE_RATING_ERROR";
		
		private var _error:PostError;
		public function get error():PostError {
			return _error;
		}
		
		public function PostErrorEvent(type:String, bubbles:Boolean = false) {
			super(type, bubbles);
			
			switch(type) {
				case MOVIE_RATING_ERROR:
					_error = new PostError("Error adding movie rating.");
					break;
				default: 
					_error = new PostError("Unknown error.");
					break;
			}
		}
		
		override public function clone():Event {
			return new PostErrorEvent(type, bubbles);
		}
	}
}