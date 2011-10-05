package com.richardhoppes.moviedb.event.movie {
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	/**
	 * Browse Movies Event 
	 * @author richard hoppes
	 * 
	 */	
	public class AddMovieRatingEvent extends Event {
		
		public static const SUCCESS:String = "AddRatingEvent.SUCCESS";
		
		private var _rawResult:String;
		
		public function get rawResult():String {
			return _rawResult;
		}
		
		public function AddMovieRatingEvent(type:String, rawResult:String, bubbles:Boolean = false) {
			super(type, bubbles);
			_rawResult = rawResult;
		}
		
		override public function clone():Event {
			return new AddMovieRatingEvent(type, rawResult, bubbles);
		}
	}
}