package com.richardhoppes.moviedb.service {
	import com.richardhoppes.moviedb.json.MovieResponseUtil;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	/**
	 * Person Service
	 * @author richard hoppes
	 * 
	 */	
	public class PersonService extends BaseService {
		public const PERSON_SEARCH_METHOD:String = "Person.search";
		public const MOVIE_IMDB_LOOKUP_METHOD:String = "Person.getVersion";
		public const MOVIE_GET_VERSION_METHOD:String = "Person.getLatest";
		public const MOVIE_GET_TRANSLATIONS_METHOD:String = "Person.getInfo";

		public function PersonService() {
			super();
		}

	}
}