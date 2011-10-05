package com.richardhoppes.moviedb.vo {
	[RemoteClass(alias="com.richardhoppes.moviedb.vo.PersonVersionVO")]
	
	/**
	 * Person Version VO 
	 * @author richard hoppes
	 * 
	 */	
	public class PersonVersionVO {
		public function PersonVersionVO() {
			super();
		}
		
		public var name:String;
		public var id:String;
		public var version:String;
		public var lastModifiedAt:Date;
	}
}