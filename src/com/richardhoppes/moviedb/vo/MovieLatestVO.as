package com.richardhoppes.moviedb.vo {
	[RemoteClass(alias="com.richardhoppes.moviedb.vo.MovieLatestVO")]
	
	/**
	 * Movie Latest VO 
	 * @author richard hoppes
	 * 
	 */	
	public class MovieLatestVO {
		public function MovieLatestVO() {
			super();
		}
		
		public var name:String;
		public var id:String;
		public var imdbId:String;
		public var version:String;
		public var lastModifiedAt:Date;
	}
}