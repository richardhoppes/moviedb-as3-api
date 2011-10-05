package com.richardhoppes.moviedb.vo {
	[RemoteClass(alias="com.richardhoppes.moviedb.vo.PersonLatestVO")]
	
	/**
	 * Movie Latest VO 
	 * @author richard hoppes
	 * 
	 */	
	public class PersonLatestVO {
		public function PersonLatestVO() {
			super();
		}

		public var name:String;
		public var id:String;
		public var version:String;
		public var lastModifiedAt:Date;
	}
}