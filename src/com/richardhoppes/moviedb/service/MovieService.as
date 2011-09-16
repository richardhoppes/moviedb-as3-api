package com.richardhoppes.moviedb.service {
	import com.richardhoppes.moviedb.event.movie.BrowseEvent;
	import com.richardhoppes.moviedb.event.movie.GetImagesEvent;
	import com.richardhoppes.moviedb.event.movie.GetInfoEvent;
	import com.richardhoppes.moviedb.event.movie.GetLatestEvent;
	import com.richardhoppes.moviedb.event.movie.GetTranslationsEvent;
	import com.richardhoppes.moviedb.event.movie.GetVersionEvent;
	import com.richardhoppes.moviedb.event.movie.IMDBLookupEvent;
	import com.richardhoppes.moviedb.event.movie.MovieSearchEvent;
	import com.richardhoppes.moviedb.json.ResponseUtil;
	import com.richardhoppes.moviedb.vo.LatestVO;
	
	import flash.events.Event;
	import mx.collections.ArrayCollection;
	
	/**
	 * Movie Service
	 * @author richard hoppes
	 * 
	 */	
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
		
		/**
		 * Retrieves search results for provided movie name 
		 * @param name String title of movie
		 * @return void 
		 */
		public function movieSearch(name:String):void {
			loadURL(buildURL(MOVIE_SEARCH_METHOD, escape(name)), movieSearch_ResultHandler);
		}
	
		/**
		 * Handles movieSearch result
		 * @param e Event  
		 * @return void
		 */
		private function movieSearch_ResultHandler(e:Event):void {
			var results:ArrayCollection = ResponseUtil.movieSearch(e.currentTarget.data as String);
			if(results.length > 0) {
				dispatchEvent(new MovieSearchEvent(MovieSearchEvent.RESULT, results, e.currentTarget.data as String));
			} else {
				dispatchEvent(new MovieSearchEvent(MovieSearchEvent.NO_RESULTS, results, e.currentTarget.data as String));
			}
		}
		
		/**
		 * Retrieves movie for the provided imdbId.
		 * @param imdbId String imdb id 
		 * @return void 
		 */
		public function imdbLookup(imdbId:String):void {
			loadURL(buildURL(MOVIE_IMDB_LOOKUP_METHOD, escape(imdbId)), imdbLookup_ResultHandler);
		}
		
		/**
		 * Handles imdbLookup result
		 * @param e Event  
		 * @return void
		 */
		private function imdbLookup_ResultHandler(e:Event):void {	
			var results:ArrayCollection = ResponseUtil.imdbLookup(e.currentTarget.data as String);
			if(results.length > 0) {
				dispatchEvent(new IMDBLookupEvent(IMDBLookupEvent.RESULT, results, e.currentTarget.data as String));
			} else {
				dispatchEvent(new IMDBLookupEvent(IMDBLookupEvent.NO_RESULTS, results, e.currentTarget.data as String));
			}
		}
		
		/**
		 * Retrieves detailed movie information for given tmdbId. 
		 * @param tmdbId String tmdb id
		 * @return void 
		 */
		public function getInfo(tmdbId:String):void {
			loadURL(buildURL(MOVIE_GET_INFO_METHOD, escape(tmdbId)), getInfo_ResultHandler);
		}
		
		/**
		 * Handles getInfo result
		 * @param e Event  
		 * @return void
		 */
		private function getInfo_ResultHandler(e:Event):void {
			var results:ArrayCollection = ResponseUtil.getInfo(e.currentTarget.data as String);
			if(results.length > 0) {
				dispatchEvent(new GetInfoEvent(GetInfoEvent.RESULT, results, e.currentTarget.data as String));
			} else {
				dispatchEvent(new GetInfoEvent(GetInfoEvent.NO_RESULTS, results, e.currentTarget.data as String));
			}
		}
		
		/**
		 * Retrieves list of available translations for the provided imdb id or tmdb id.
		 * @param id String imdbId or tmdbId
		 * @return void 
		 */
		public function getTranslations(id:String):void {
			loadURL(buildURL(MOVIE_GET_TRANSLATIONS_METHOD, escape(id)), getTranslations_ResultHandler);
		}
		
		/**
		 * Handles getTranslations result
		 * @param e Event  
		 * @return void
		 */
		private function getTranslations_ResultHandler(e:Event):void {	
			var results:ArrayCollection = ResponseUtil.getTranslations(e.currentTarget.data as String);
			if(results.length > 0) {
				dispatchEvent(new GetTranslationsEvent(GetTranslationsEvent.RESULT, results, e.currentTarget.data as String));
			} else {
				dispatchEvent(new GetTranslationsEvent(GetTranslationsEvent.NO_RESULTS, results, e.currentTarget.data as String));
			}
		}
		
		/**
		 * Retrieves one or more versions for the provided imdb ids or tmdb ids.
		 * @param id String single or comma delimited list of imdbIds and/or tmdbIds
		 * @return void 
		 */
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
		
		/**
		 * Handles getVersion result
		 * @param e Event  
		 * @return void
		 */
		private function getVersion_ResultHandler(e:Event):void {	
			var results:ArrayCollection = ResponseUtil.getVersion(e.currentTarget.data as String);
			if(results.length > 0) {
				dispatchEvent(new GetVersionEvent(GetVersionEvent.RESULT, results, e.currentTarget.data as String));
			} else {
				dispatchEvent(new GetVersionEvent(GetVersionEvent.NO_RESULTS, results, e.currentTarget.data as String));
			}
		}
		
		/**
		 * Retrieves ids for latest movie created
		 * @return void 
		 */
		public function getLatest():void {
			loadURL(buildURL(MOVIE_GET_LATEST_METHOD), getLatest_ResultHandler);
		}
		
		/**
		 * Handles getLatest result
		 * @param e Event  
		 * @return void
		 */
		private function getLatest_ResultHandler(e:Event):void {	
			var results:LatestVO = ResponseUtil.getLatest(e.currentTarget.data as String);
			if(results != null && results.id != null) {
				dispatchEvent(new GetLatestEvent(GetLatestEvent.RESULT, results, e.currentTarget.data as String));
			} else {
				dispatchEvent(new GetLatestEvent(GetLatestEvent.NO_RESULTS, results, e.currentTarget.data as String));
			}
		}
		
		/*
		TODO: Implement these methods
		public function getImages(id:String):void {
			loadURL(buildURL(MOVIE_GET_IMAGES_METHOD, escape(id)), getImages_ResultHandler);
		}
		
		private function getImages_ResultHandler(e:Event):void {	
			trace("images result:" + e.currentTarget.data as String);
		}
		
		public function browse():void {
			loadURL(buildURL(MOVIE_BROWSE_METHOD), browse_ResultHandler);
		}
		
		private function browse_ResultHandler(e:Event):void {	
			trace("browse result:" + e.currentTarget.data as String);
		}
		*/
	}
}