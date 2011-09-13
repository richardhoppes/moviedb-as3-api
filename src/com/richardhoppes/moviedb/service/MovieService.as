package com.richardhoppes.moviedb.service {
	import com.richardhoppes.moviedb.event.GetVersionEvent;
	import com.richardhoppes.moviedb.event.IMDBLookupEvent;
	import com.richardhoppes.moviedb.event.MovieSearchEvent;
	import com.richardhoppes.moviedb.event.GetTranslationsEvent;
	
	import flash.events.Event;
	
	public class MovieService extends BaseService {
		public const MOVIE_SEARCH_METHOD:String = "Movie.search";
		public const MOVIE_IMDB_LOOKUP_METHOD:String = "Movie.imdbLookup";
		public const MOVIE_GET_VERSION_METHOD:String = "Movie.getVersion";
		public const MOVIE_GET_TRANSLATIONS_METHOD:String = "Movie.getTranslations";
		public const MOVIE_GET_LATEST_METHOD:String = "Movie.getLatest";
		public const MOVIE_GET_INFO_METHOD:String = "Movie.getInfo";
		public const MOVIE_GET_IMAGES_METHOD:String = "Movie.getImages";
		public const MOVIE_BROWSE_METHOD:String = "Movie.browse";

		public function MovieService() {
			super();
		}
		
		public function movieSearch(movieTitle:String):void {
			loadURL(buildURL(MOVIE_SEARCH_METHOD, escape(movieTitle)), movieSearch_ResultHandler);
		}
	
		private function movieSearch_ResultHandler(e:Event):void {	
			var results:Array = parseResponse(e.currentTarget.data as String);
			if(results.length > 0) {
				dispatchEvent(new MovieSearchEvent(MovieSearchEvent.RESULT, results, e.currentTarget.data as String));
			} else {
				dispatchEvent(new MovieSearchEvent(MovieSearchEvent.NO_RESULTS, results, e.currentTarget.data as String));
			}
		}
		
		public function imdbLookup(imdbId:String):void {
			loadURL(buildURL(MOVIE_IMDB_LOOKUP_METHOD, escape(imdbId)), imdbLookup_ResultHandler);
		}
		
		private function imdbLookup_ResultHandler(e:Event):void {	
			var results:Array = parseResponse(e.currentTarget.data as String);
			if(results.length > 0) {
				dispatchEvent(new MovieSearchEvent(IMDBLookupEvent.RESULT, results, e.currentTarget.data as String));
			} else {
				dispatchEvent(new MovieSearchEvent(IMDBLookupEvent.NO_RESULTS, results, e.currentTarget.data as String));
			}
		}
		
		// IMDB or TMDb ids
		public function getVersion(ids:*):void {
			var idList:String = "";
			if (ids is Array) {
				for each (var id:String in ids) {
					if(idList != "")
						idList += ",";
					idList += id;
				}
			} else {
				idList = ids;
			}
			loadURL(buildURL(MOVIE_GET_VERSION_METHOD, escape(idList)), getVersion_ResultHandler);
		}
		
		private function getVersion_ResultHandler(e:Event):void {	
			var results:Array = parseResponse(e.currentTarget.data as String);
			if(results.length > 0) {
				dispatchEvent(new GetVersionEvent(GetVersionEvent.RESULT, results, e.currentTarget.data as String));
			} else {
				dispatchEvent(new GetVersionEvent(GetVersionEvent.NO_RESULTS, results, e.currentTarget.data as String));
			}
		}
		
		public function getTranslations(id:String):void {
			loadURL(buildURL(MOVIE_GET_TRANSLATIONS_METHOD, escape(id)), getTranslations_ResultHandler);
		}
		
		private function getTranslations_ResultHandler(e:Event):void {	
			var results:Array = parseResponse(e.currentTarget.data as String);
			if(results.length > 0) {
				dispatchEvent(new GetTranslationsEvent(GetTranslationsEvent.RESULT, results, e.currentTarget.data as String));
			} else {
				dispatchEvent(new GetTranslationsEvent(GetTranslationsEvent.NO_RESULTS, results, e.currentTarget.data as String));
			}
		}
		
		public function getLatest():void {
			this.loadURL("", null);
		}
		
		public function getInfo():void {
			this.loadURL("", null);
		}
		
		public function getImages():void {
			this.loadURL("", null);
		}
		
		public function browse():void {
			this.loadURL("", null);
		}
	}
}