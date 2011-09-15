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

		public var castId:String;
		public var url:String;
		public var order:Number;
		public var character:String;
		public var name:String;
		public var profile:String;
		public var job:String;
		public var id:String;
		public var department:String;
	}
}