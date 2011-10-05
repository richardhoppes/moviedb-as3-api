package com.richardhoppes.moviedb.vo {
	[RemoteClass(alias="com.richardhoppes.moviedb.vo.PersonVO")]
	
	/**
	 * Person VO 
	 * @author richard hoppes
	 * 
	 */	
	public class PersonVO {
		public function PersonVO() {
			super();
		}
		
		public var id:String;
		public var name:String;
		public var version:String;
		public var url:String;
		public var popularity:Number;
		public var biography:String;
		public var images:Vector.<ImageVO>;		
		public var lastModifiedAt:Date;
	}
	
}