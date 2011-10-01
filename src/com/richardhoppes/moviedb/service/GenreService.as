package com.richardhoppes.moviedb.service {
	import com.richardhoppes.moviedb.event.genre.GetGenreListEvent;
	import com.richardhoppes.moviedb.json.GenreResponseUtil;
	
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

		/**
		 * Retrieves a list of genres 
		 * @return void 
		 */
		public function getList():void {
			loadURL(buildRequestURL(GENRE_GET_LIST_METHOD), getList_ResultHandler);
		}
		
		/**
		 * Handles get list results
		 * @param e Event  
		 * @return void
		 */
		private function getList_ResultHandler(e:Event):void {
			var results:ArrayCollection = GenreResponseUtil.getList(e.currentTarget.data as String);
			if(results.length > 0) {
				dispatchEvent(new GetGenreListEvent(GetGenreListEvent.RESULT, results, e.currentTarget.data as String));
			} else {
				dispatchEvent(new GetGenreListEvent(GetGenreListEvent.NO_RESULTS, results, e.currentTarget.data as String));
			}
		}
		
	}
}