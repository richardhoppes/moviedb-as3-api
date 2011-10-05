package com.richardhoppes.moviedb.vo {

	[RemoteClass(alias="com.richardhoppes.moviedb.vo.MovieSearchVO")]
	
	/**
	 * Movie Search VO 
	 * @author richard hoppes
	 * 
	 */	
	public class MovieSearchVO extends MovieVO {
		public function MovieSearchVO() {
			super();
		}

		public var score:Number;
		public var adult:Boolean;
	}
}