package com.richardhoppes.moviedb.vo {
	[RemoteClass(alias="com.richardhoppes.moviedb.vo.CastVO")]
	
	/**
	 * Cast VO 
	 * @author richard hoppes
	 * 
	 */	
	public class CastVO {
		public function CastVO() {
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
		
		//TODO: Subclass for cast items returned by getInfo call?
		// poster (url) (string)
		// adult (boolean)
		// release (YYYY-MM-DD) (string)
	}
}