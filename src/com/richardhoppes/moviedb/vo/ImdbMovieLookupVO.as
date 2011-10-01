package com.richardhoppes.moviedb.vo {
	import mx.collections.ArrayCollection;

	[RemoteClass(alias="com.richardhoppes.moviedb.vo.ImdbMovieLookupVO")]
	
	/**
	 * Imdb Movie Lookup VO 
	 * @author richard hoppes
	 * 
	 */	
	public class ImdbMovieLookupVO extends MovieVO {
		public function ImdbMovieLookupVO() {
			super();
		}
		
		public var runtime:Number;
		public var genres:ArrayCollection;
	}
}