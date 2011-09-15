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
		public var genres:ArrayCollection;
		public var adult:Boolean;
		public var tagline:String;
		public var budget:Number;
		public var revenue:Number;
		public var homepage:String;
		public var trailer:String;	
		public var studios:ArrayCollection;
		public var countries:ArrayCollection;
		public var people:ArrayCollection;
	}
}