package com.richardhoppes.moviedb.vo {
	import mx.collections.ArrayCollection;

	[RemoteClass(alias="com.richardhoppes.moviedb.vo.MovieInfoVO")]
	
	/**
	 * Movie Info VO 
	 * @author richard hoppes
	 * 
	 */	
	public class MovieInfoVO extends MovieVO {
		public function MovieInfoVO() {
			super();
		}
		
		public var runtime:Number;
		public var adult:Boolean;
		public var tagline:String;
		public var budget:Number;
		public var revenue:Number;
		public var homepage:String;
		public var trailer:String;
		public var genres:ArrayCollection;		// Collection of genre objects
		public var studios:ArrayCollection;		// Collection of studio objects
		public var countries:ArrayCollection;	// Collection of country objects
		public var people:ArrayCollection;		// Collection of person objects
	}
}