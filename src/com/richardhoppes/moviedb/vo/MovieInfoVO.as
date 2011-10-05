package com.richardhoppes.moviedb.vo {
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
		public var genres:Vector.<GenreVO>;		
		public var studios:Vector.<StudioVO>;		
		public var countries:Vector.<CountryVO>;	
		public var people:Vector.<CastVO>;		
	}
}