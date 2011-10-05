package com.richardhoppes.moviedb.vo {
	import mx.collections.ArrayCollection;

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
		public var lastModifiedAt:String;
		public var url:String;
		public var popularity:Number;
		public var biography:String;
		public var images:ArrayCollection;		// Collection of image objects
	}
	
}