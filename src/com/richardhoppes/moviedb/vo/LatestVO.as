package com.richardhoppes.moviedb.vo {
	[RemoteClass(alias="com.richardhoppes.moviedb.vo.LatestVO")]
	
	/**
	 * Latest VO 
	 * @author richard hoppes
	 * 
	 */	
	public class LatestVO {
		public function LatestVO() {
			super();
		}
		
		public var name:String;
		public var id:String;
		public var imdbId:String;
		public var version:String;
		public var lastModifiedAt:String;
	}
}