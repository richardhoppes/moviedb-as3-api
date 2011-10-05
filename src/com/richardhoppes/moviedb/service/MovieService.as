package com.richardhoppes.moviedb.service {
	import com.richardhoppes.moviedb.error.PostError;
	import com.richardhoppes.moviedb.event.PostErrorEvent;
	import com.richardhoppes.moviedb.event.movie.AddMovieRatingEvent;
	import com.richardhoppes.moviedb.event.movie.BrowseMoviesEvent;
	import com.richardhoppes.moviedb.event.movie.GetLatestMovieEvent;
	import com.richardhoppes.moviedb.event.movie.GetMovieImagesEvent;
	import com.richardhoppes.moviedb.event.movie.GetMovieInfoEvent;
	import com.richardhoppes.moviedb.event.movie.GetMovieTranslationsEvent;
	import com.richardhoppes.moviedb.event.movie.GetMovieVersionEvent;
	import com.richardhoppes.moviedb.event.movie.IMDBMovieLookupEvent;
	import com.richardhoppes.moviedb.event.movie.MovieSearchEvent;
	import com.richardhoppes.moviedb.json.MovieResponseUtil;
	import com.richardhoppes.moviedb.json.ParseUtil;
	import com.richardhoppes.moviedb.vo.MovieImdbLookupVO;
	import com.richardhoppes.moviedb.vo.MovieInfoVO;
	import com.richardhoppes.moviedb.vo.MovieLatestVO;
	
	import flash.events.Event;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	
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
		public const MOVIE_ADD_RATING_METHOD:String = "Movie.addRating";

		public function MovieService() {
			super();
		}
		
		/**
		 * Retrieves search results for provided movie name 
		 * @param name String title of movie
		 * @return void 
		 */
		public function movieSearch(name:String):void {
			loadURL(buildGetURL(MOVIE_SEARCH_METHOD, escape(name)), movieSearch_ResultHandler);
		}
	
		/**
		 * Handles movieSearch result
		 * @param e Event  
		 * @return void
		 */
		private function movieSearch_ResultHandler(e:Event):void {
			var results:ArrayCollection = MovieResponseUtil.movieSearch(e.currentTarget.data as String);
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
			loadURL(buildGetURL(MOVIE_IMDB_LOOKUP_METHOD, escape(imdbId)), imdbLookup_ResultHandler);
		}
		
		/**
		 * Handles imdbLookup result
		 * @param e Event  
		 * @return void
		 */
		private function imdbLookup_ResultHandler(e:Event):void {	
			var result:MovieImdbLookupVO = MovieResponseUtil.imdbLookup(e.currentTarget.data as String);
			if(result.id != null && result.id != "") {
				dispatchEvent(new IMDBMovieLookupEvent(IMDBMovieLookupEvent.RESULT, result, e.currentTarget.data as String));
			} else {
				dispatchEvent(new IMDBMovieLookupEvent(IMDBMovieLookupEvent.NO_RESULTS, result, e.currentTarget.data as String));
			}
		}
		
		/**
		 * Retrieves detailed movie information for given tmdbId. 
		 * @param tmdbId String tmdb id
		 * @return void 
		 */
		public function getInfo(tmdbId:String):void {
			loadURL(buildGetURL(MOVIE_GET_INFO_METHOD, escape(tmdbId)), getInfo_ResultHandler);
		}
		
		/**
		 * Handles getInfo result
		 * @param e Event  
		 * @return void
		 */
		private function getInfo_ResultHandler(e:Event):void {
			var result:MovieInfoVO = MovieResponseUtil.getInfo(e.currentTarget.data as String);
			if(result.id != null && result.id != "") {
				dispatchEvent(new GetMovieInfoEvent(GetMovieInfoEvent.RESULT, result, e.currentTarget.data as String));
			} else {
				dispatchEvent(new GetMovieInfoEvent(GetMovieInfoEvent.NO_RESULTS, result, e.currentTarget.data as String));
			}
		}
		
		/**
		 * Retrieves list of available translations for the provided imdb id or tmdb id.
		 * @param id String imdbId or tmdbId
		 * @return void 
		 */
		public function getTranslations(id:String):void {
			loadURL(buildGetURL(MOVIE_GET_TRANSLATIONS_METHOD, escape(id)), getTranslations_ResultHandler);
		}
		
		/**
		 * Handles getTranslations result
		 * @param e Event  
		 * @return void
		 */
		private function getTranslations_ResultHandler(e:Event):void {	
			var results:ArrayCollection = MovieResponseUtil.getTranslations(e.currentTarget.data as String);
			if(results.length > 0) {
				dispatchEvent(new GetMovieTranslationsEvent(GetMovieTranslationsEvent.RESULT, results, e.currentTarget.data as String));
			} else {
				dispatchEvent(new GetMovieTranslationsEvent(GetMovieTranslationsEvent.NO_RESULTS, results, e.currentTarget.data as String));
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
			loadURL(buildGetURL(MOVIE_GET_VERSION_METHOD, escape(idList)), getVersion_ResultHandler);
		}
		
		/**
		 * Handles getVersion result
		 * @param e Event  
		 * @return void
		 */
		private function getVersion_ResultHandler(e:Event):void {	
			var results:ArrayCollection = MovieResponseUtil.getVersion(e.currentTarget.data as String);
			if(results.length > 0) {
				dispatchEvent(new GetMovieVersionEvent(GetMovieVersionEvent.RESULT, results, e.currentTarget.data as String));
			} else {
				dispatchEvent(new GetMovieVersionEvent(GetMovieVersionEvent.NO_RESULTS, results, e.currentTarget.data as String));
			}
		}
		
		/**
		 * Retrieves ids for latest movie created
		 * @return void 
		 */
		public function getLatest():void {
			loadURL(buildGetURL(MOVIE_GET_LATEST_METHOD), getLatest_ResultHandler);
		}
		
		/**
		 * Handles getLatest result
		 * @param e Event  
		 * @return void
		 */
		private function getLatest_ResultHandler(e:Event):void {	
			var result:MovieLatestVO = MovieResponseUtil.getLatest(e.currentTarget.data as String);
			if(result.id != null && result.id != "") {
				dispatchEvent(new GetLatestMovieEvent(GetLatestMovieEvent.RESULT, result, e.currentTarget.data as String));
			} else {
				dispatchEvent(new GetLatestMovieEvent(GetLatestMovieEvent.NO_RESULTS, result, e.currentTarget.data as String));
			}
		}
		
		/**
		 * Retrieve images for the provided tmdb id or imdb id
		 * @param id tmdbId or imdbId
		 * @return void 
		 */
		public function getImages(id:String):void {
			loadURL(buildGetURL(MOVIE_GET_IMAGES_METHOD, escape(id)), getImages_ResultHandler);
		}
		
		/**
		 * Handles getImages result
		 * @param e Event  
		 * @return void
		 */
		private function getImages_ResultHandler(e:Event):void {	
			var results:ArrayCollection = MovieResponseUtil.getImages(e.currentTarget.data as String);
			if(results.length > 0) {
				dispatchEvent(new GetMovieImagesEvent(GetMovieImagesEvent.RESULT, results, e.currentTarget.data as String));
			} else {
				dispatchEvent(new GetMovieImagesEvent(GetMovieImagesEvent.NO_RESULTS, results, e.currentTarget.data as String));
			}
		}

		/**
		 * Retrieve images for the provided tmdb id or imdb id
		 * @param order String sorting order (asc, desc)
		 * @param orderBy String result sorting (title, rating, release 
		 * @param perPage Number number of results per page
		 * @param page Number current page
		 * @param query String title search
		 * @param minVotes Number minimum number of votes a movie has
		 * @param ratingMin Number minimum movie rating
		 * @param ratingMax Number maximum movie rating, required if rating min is used
		 * @param genres String one or more genre ids, comma delimited
		 * @param genresSelector String used if more than one genre is specified (and, or)
		 * @param releaseMin int min release date (epoch value) 
		 * @param releaseMax int max release date (epoch value)
		 * @param year String release year (19##, 20##)
		 * @param certifications String MPAA ratings, comma separated (G, PG, PG-13, R, NC-17), always an or search
		 * @param companies String one or more company id, comma delimited
		 * @param countries String one or more country codes, comma delimited
		 * @return void 
		 */
		public function browse(order:String = "asc", orderBy:String = "title", perPage:Number = 30, page:Number = 1, query:String = null, 
			minVotes:Number = -1, ratingMin:Number = -1, ratingMax:Number = -1, genres:String = null, genresSelector:String = "and", 
			releaseMin:int = 0, releaseMax:int = 0, year:String = null, certifications:String = null, companies:String = null, countries:String = null):void {
			
			var queryString:String = "";
			
			if(order != 'asc' && order != 'desc') 
				order = 'asc';

			
			if(orderBy != 'title' && orderBy != 'release' && orderBy != 'rating') 
				orderBy = 'title';

			queryString = "?order=asc";
			queryString += "&order_by=" + orderBy;
			queryString += "&per_page=" + perPage;
			queryString += "&page=" + page;
			
			if(query != null)
				queryString += "&query=" + escape(query);
			
			if(minVotes != -1)
				queryString += "&min_votes=" + minVotes; 
			
			if(ratingMin != -1)
				queryString += "&rating_min=" + ratingMin;
			
			if(ratingMax != -1)
				queryString += "&rating_max=" + ratingMax;
			
			if(genres != null)
				queryString += "&genres=" + genres;
			
			if(genres != null && genresSelector != null && genresSelector == 'and' || genresSelector == 'or') 
				queryString += "&genres_selector=" + genresSelector;

			if(releaseMin != 0 && releaseMax != 0) {
				queryString += "&release_min=" + releaseMin;
				queryString += "&release_max=" + releaseMax;
			}
				
			if(year != null)
				queryString += "&year=" + year;
			
			if(certifications != null)
				queryString += "&certifications=" + certifications;
			
			if(companies != null)
				queryString += "&companies=" + companies;

			if(countries != null)
				queryString += "&countries=" + countries;
						
			loadURL(buildGetURL(MOVIE_BROWSE_METHOD, queryString), browse_ResultHandler);
		}
		
		private function browse_ResultHandler(e:Event):void {	
			var results:ArrayCollection = MovieResponseUtil.browse(e.currentTarget.data as String);
			if(results.length > 0) {
				dispatchEvent(new BrowseMoviesEvent(BrowseMoviesEvent.RESULT, results, e.currentTarget.data as String));
			} else {
				dispatchEvent(new BrowseMoviesEvent(BrowseMoviesEvent.NO_RESULTS, results, e.currentTarget.data as String));
			}
		}
		
		public function addRating(sessionKey:String, tmdbId:Number, rating:Number):void {
			var variables : URLVariables = new URLVariables();  
			variables.rating = rating.toFixed(1);  
			variables.id = tmdbId;  
			variables.session_key = sessionKey;
			loadURL(buildPostURL(MOVIE_ADD_RATING_METHOD), addRating_ResultHandler, URLRequestMethod.POST, variables);
		}
		
		private function addRating_ResultHandler(e:Event):void {
			var jsonResult:Object = ParseUtil.decodeAsObject(e.currentTarget.data as String); 
			if(jsonResult.code == 12) {
				dispatchEvent(new AddMovieRatingEvent(AddMovieRatingEvent.SUCCESS, e.currentTarget.data as String));
			} else {
				dispatchEvent(new PostErrorEvent(PostErrorEvent.MOVIE_RATING_ERROR));
			}
		}
	}
}