package com.richardhoppes.moviedb.vo {
	import mx.collections.ArrayCollection;

	[RemoteClass(alias="com.richardhoppes.moviedb.vo.MovieImdbLookupVO")]
	
	/**
	 * Movie Imdb Lookup VO 
	 * @author richard hoppes
	 * 
	 */	
	public class MovieImdbLookupVO extends MovieVO {
		public function MovieImdbLookupVO() {
			super();
		}
		
		public var runtime:Number;
		public var genres:ArrayCollection;
	}
}