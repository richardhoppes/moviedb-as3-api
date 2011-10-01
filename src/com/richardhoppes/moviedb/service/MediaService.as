package com.richardhoppes.moviedb.service {
	import com.richardhoppes.moviedb.json.MovieResponseUtil;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	/**
	 * Media Service
	 * @author richard hoppes
	 * 
	 */	
	public class MediaService extends BaseService {
		public const MEDIA_GET_INFO_METHOD:String = "Media.getInfo";
		public const MEDIA_ADD_ID_METHOD:String = "Media.addId";

		public function MediaService() {
			super();
		}

	}
}