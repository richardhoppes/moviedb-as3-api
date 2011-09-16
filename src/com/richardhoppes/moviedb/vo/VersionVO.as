package com.richardhoppes.moviedb.vo {
	[RemoteClass(alias="com.richardhoppes.moviedb.vo.VersionVO")]
	
	/**
	 * Version VO 
	 * @author richard hoppes
	 * 
	 */	
	public class VersionVO {
		public function VersionVO() {
			super();
		}
		
		public var name:String;
		public var id:String;
		public var imdbId:String;
		public var version:String;
		public var lastModifiedAt:String;
	}
}