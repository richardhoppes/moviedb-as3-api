package com.richardhoppes.moviedb.vo {
	[RemoteClass(alias="com.richardhoppes.moviedb.vo.GenreVO")]
	
	/**
	 * Genre VO 
	 * @author richard hoppes
	 * 
	 */	
	public class GenreVO {
		public function GenreVO() {
			super();
		}
		
		public var url:String;
		public var id:String;
		public var type:String;
		public var name:String;
	}
}