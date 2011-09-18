package com.richardhoppes.moviedb.vo {
	import mx.collections.ArrayCollection;

	[RemoteClass(alias="com.richardhoppes.moviedb.vo.MovieBrowseVO")]
	
	/**
	 * Movie Browse VO 
	 * @author richard hoppes
	 * 
	 */	
	public class MovieBrowseVO extends MovieVO {
		public function MovieBrowseVO() {
			super();
		}
		
		public var runtime:Number;
		public var adult:Boolean;
		public var score:Number;
	}
}