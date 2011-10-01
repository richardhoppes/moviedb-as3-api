package com.richardhoppes.moviedb.vo {
	[RemoteClass(alias="com.richardhoppes.moviedb.vo.LatestMovieVO")]
	
	/**
	 * Latest Movie VO 
	 * @author richard hoppes
	 * 
	 */	
	public class LatestMovieVO {
		public function LatestMovieVO() {
			super();
		}
		
		public var name:String;
		public var id:String;
		public var imdbId:String;
		public var version:String;
		public var lastModifiedAt:String;
	}
}