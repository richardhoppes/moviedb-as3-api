package com.richardhoppes.moviedb.service {
	import com.richardhoppes.moviedb.json.ResponseUtil;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	/**
	 * Genre Service
	 * @author richard hoppes
	 * 
	 */	
	public class GenreService extends BaseService {
		public const GENRE_GET_LIST_METHOD:String = "Genres.getList";

		public function GenreService() {
			super();
		}

	}
}