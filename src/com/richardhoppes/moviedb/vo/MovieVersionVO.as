package com.richardhoppes.moviedb.vo {
	[RemoteClass(alias="com.richardhoppes.moviedb.vo.MovieVersionVO")]
	
	/**
	 * Movie Version VO 
	 * @author richard hoppes
	 * 
	 */	
	public class MovieVersionVO {
		public function MovieVersionVO() {
			super();
		}
		
		public var name:String;
		public var id:String;
		public var imdbId:String;
		public var version:String;
		public var lastModifiedAt:String;
	}
}