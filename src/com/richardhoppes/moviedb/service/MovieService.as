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
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
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
			var results:ArrayCollection = ResponseUtil.movieSearch(e.currentTarget.data as String);
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
			var results:ArrayCollection = ResponseUtil.imdbLookup(e.currentTarget.data as String);
			if(results.length > 0) {
				dispatchEvent(new IMDBLookupEvent(IMDBLookupEvent.RESULT, results, e.currentTarget.data as String));
			} else {
				dispatchEvent(new IMDBLookupEvent(IMDBLookupEvent.NO_RESULTS, results, e.currentTarget.data as String));
			}
		}
		
		public function getInfo(tmdbId:String):void {
			loadURL(buildURL(MOVIE_GET_INFO_METHOD, escape(tmdbId)), getInfo_ResultHandler);
		}
		
		private function getInfo_ResultHandler(e:Event):void {
			var results:ArrayCollection = ResponseUtil.getInfo(e.currentTarget.data as String);
			if(results.length > 0) {
				dispatchEvent(new GetInfoEvent(GetInfoEvent.RESULT, results, e.currentTarget.data as String));
			} else {
				dispatchEvent(new GetInfoEvent(GetInfoEvent.NO_RESULTS, results, e.currentTarget.data as String));
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
			/*var results:Array = parseResponse(e.currentTarget.data as String);
			if(results.length > 0) {
				dispatchEvent(new GetVersionEvent(GetVersionEvent.RESULT, results, e.currentTarget.data as String));
			} else {
				dispatchEvent(new GetVersionEvent(GetVersionEvent.NO_RESULTS, results, e.currentTarget.data as String));
			}*/
		}
		
		// IMDB or TMDb ids
		public function getTranslations(id:String):void {
			loadURL(buildURL(MOVIE_GET_TRANSLATIONS_METHOD, escape(id)), getTranslations_ResultHandler);
		}
		
		private function getTranslations_ResultHandler(e:Event):void {	
			/*var results:Array = parseResponse(e.currentTarget.data as String);
			if(results.length > 0) {
				dispatchEvent(new GetTranslationsEvent(GetTranslationsEvent.RESULT, results, e.currentTarget.data as String));
			} else {
				dispatchEvent(new GetTranslationsEvent(GetTranslationsEvent.NO_RESULTS, results, e.currentTarget.data as String));
			}*/
		}
		
		public function getLatest():void {
			loadURL(buildURL(MOVIE_GET_LATEST_METHOD), getLatest_ResultHandler);
			this.loadURL(buildURL(MOVIE_GET_INFO_METHOD), getLatest_ResultHandler);
		}
		
		private function getLatest_ResultHandler(e:Event):void {	
			/*var results:Array = parseResponse(e.currentTarget.data as String);
			if(results.length > 0) {
				dispatchEvent(new GetLatestEvent(GetLatestEvent.RESULT, results, e.currentTarget.data as String));
			} else {
				dispatchEvent(new GetLatestEvent(GetLatestEvent.NO_RESULTS, results, e.currentTarget.data as String));
			}*/
		}
		
		// IMDB or TMDb ids
		public function getImages(id:String):void {
			loadURL(buildURL(MOVIE_GET_IMAGES_METHOD, escape(id)), getImages_ResultHandler);
		}
		
		private function getImages_ResultHandler(e:Event):void {	
			/*var results:Array = parseResponse(e.currentTarget.data as String);
			if(results.length > 0) {
				dispatchEvent(new GetImagesEvent(GetImagesEvent.RESULT, results, e.currentTarget.data as String));
			} else {
				dispatchEvent(new GetImagesEvent(GetImagesEvent.NO_RESULTS, results, e.currentTarget.data as String));
			}*/
		}
		
		public function browse():void {
			loadURL(buildURL(MOVIE_BROWSE_METHOD), browse_ResultHandler);
		}
		
		private function browse_ResultHandler(e:Event):void {	
			/*var results:Array = parseResponse(e.currentTarget.data as String);
			if(results.length > 0) {
				dispatchEvent(new BrowseEvent(BrowseEvent.RESULT, results, e.currentTarget.data as String));
			} else {
				dispatchEvent(new BrowseEvent(BrowseEvent.RESULT, results, e.currentTarget.data as String));
			}*/
		}
	}
}