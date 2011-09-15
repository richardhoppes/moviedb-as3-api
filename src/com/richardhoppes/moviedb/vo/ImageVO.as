package com.richardhoppes.moviedb.vo {
	[RemoteClass(alias="com.richardhoppes.moviedb.vo.ImageVO")]
	/**
	 * Image VO 
	 * @author richard hoppes
	 * 
	 */	
	public class ImageVO {
		public function ImageVO() {
			super();
		}
		
		public var width:Number;
		public var url:String;
		public var id:Number;
		public var height:Number;
		public var size:Number;
		public var type:String;
	}
}