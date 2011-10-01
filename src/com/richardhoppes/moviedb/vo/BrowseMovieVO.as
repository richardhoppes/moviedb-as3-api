package com.richardhoppes.moviedb.vo {
	import mx.collections.ArrayCollection;

	[RemoteClass(alias="com.richardhoppes.moviedb.vo.BrowseMovieVO")]
	
	/**
	 * Browse Movie VO 
	 * @author richard hoppes
	 * 
	 */	
	public class BrowseMovieVO extends MovieVO {
		public function BrowseMovieVO() {
			super();
		}
		
		public var runtime:Number;
		public var adult:Boolean;
		public var score:Number;
	}
}