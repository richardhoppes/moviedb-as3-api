package com.richardhoppes.moviedb.service {
	import com.richardhoppes.moviedb.event.person.GetLatestPersonEvent;
	import com.richardhoppes.moviedb.event.person.GetPersonInfoEvent;
	import com.richardhoppes.moviedb.event.person.GetPersonVersionEvent;
	import com.richardhoppes.moviedb.event.person.PersonSearchEvent;
	import com.richardhoppes.moviedb.util.json.MovieResponseUtil;
	import com.richardhoppes.moviedb.util.json.PersonResponseUtil;
	import com.richardhoppes.moviedb.vo.PersonInfoVO;
	import com.richardhoppes.moviedb.vo.PersonLatestVO;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	/**
	 * Person Service
	 * @author richard hoppes
	 * 
	 */	
	public class PersonService extends BaseService {
		public const PERSON_SEARCH_METHOD:String = "Person.search";
		public const PERSON_GET_VERSION_METHOD:String = "Person.getVersion";
		public const PERSON_GET_LATEST_METHOD:String = "Person.getLatest";
		public const PERSON_GET_INFO_METHOD:String = "Person.getInfo";

		public function PersonService() {
			super();
		}

		/**
		 * Retrieves search results for provided name 
		 * @param name String name of person
		 * @return void 
		 */
		public function personSearch(name:String):void {
			loadURL(buildGetURL(PERSON_SEARCH_METHOD, escape(name)), personSearch_ResultHandler);
		}
		
		/**
		 * Handles personSearch result
		 * @param e Event  
		 * @return void
		 */
		private function personSearch_ResultHandler(e:Event):void {
			var results:ArrayCollection = PersonResponseUtil.personSearch(e.currentTarget.data as String);
			if(results.length > 0) {
				dispatchEvent(new PersonSearchEvent(PersonSearchEvent.RESULT, results, e.currentTarget.data as String));
			} else {
				dispatchEvent(new PersonSearchEvent(PersonSearchEvent.NO_RESULTS, results, e.currentTarget.data as String));
			}
		}
		
		/**
		 * Retrieves detailed person information for given tmdbId. 
		 * @param tmdbId String tmdb id
		 * @return void 
		 */
		public function getInfo(tmdbId:String):void {
			loadURL(buildGetURL(PERSON_GET_INFO_METHOD, escape(tmdbId)), getInfo_ResultHandler);
		}
		
		/**
		 * Handles getInfo result
		 * @param e Event  
		 * @return void
		 */
		private function getInfo_ResultHandler(e:Event):void {
			var result:PersonInfoVO = PersonResponseUtil.getInfo(e.currentTarget.data as String);
			if(result.id != null && result.id != "") {
				dispatchEvent(new GetPersonInfoEvent(GetPersonInfoEvent.RESULT, result, e.currentTarget.data as String));
			} else {
				dispatchEvent(new GetPersonInfoEvent(GetPersonInfoEvent.NO_RESULTS, result, e.currentTarget.data as String));
			}
		}
		
		/**
		 * Retrieves ids for latest person created
		 * @return void 
		 */
		public function getLatest():void {
			loadURL(buildGetURL(PERSON_GET_LATEST_METHOD), getLatest_ResultHandler);
		}
		
		/**
		 * Handles getLatest result
		 * @param e Event  
		 * @return void
		 */
		private function getLatest_ResultHandler(e:Event):void {	
			var result:PersonLatestVO = PersonResponseUtil.getLatest(e.currentTarget.data as String);
			if(result.id != null && result.id != "") {
				dispatchEvent(new GetLatestPersonEvent(GetLatestPersonEvent.RESULT, result, e.currentTarget.data as String));
			} else {
				dispatchEvent(new GetLatestPersonEvent(GetLatestPersonEvent.NO_RESULTS, result, e.currentTarget.data as String));
			}
		}
		
		/**
		 * Retrieves one or more versions for the provided tmdb person ids.
		 * @param id String single or comma delimited list of tmdb person ids
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
			loadURL(buildGetURL(PERSON_GET_VERSION_METHOD, escape(idList)), getVersion_ResultHandler);
		}
		
		/**
		 * Handles getVersion result
		 * @param e Event  
		 * @return void
		 */
		private function getVersion_ResultHandler(e:Event):void {	
			var results:ArrayCollection = PersonResponseUtil.getVersion(e.currentTarget.data as String);
			if(results.length > 0) {
				dispatchEvent(new GetPersonVersionEvent(GetPersonVersionEvent.RESULT, results, e.currentTarget.data as String));
			} else {
				dispatchEvent(new GetPersonVersionEvent(GetPersonVersionEvent.NO_RESULTS, results, e.currentTarget.data as String));
			}
		}
		
		
	}
}