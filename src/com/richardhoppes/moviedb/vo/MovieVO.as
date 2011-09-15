package com.richardhoppes.moviedb.vo {
	import mx.collections.ArrayCollection;

	[RemoteClass(alias="com.richardhoppes.moviedb.vo.MovieVO")]
	/**
	 * Movie VO 
	 * @author richard hoppes
	 * 
	 */	
	public class MovieVO {
		public function MovieVO() {
			super();
		}
		
		public var popularity:Number;
		public var translated:Boolean;
		public var language:String;
		public var originalName:String;
		public var name:String;
		public var alternativeName:String;
		public var movieType:String;
		public var id:String;
		public var imdbId:String;
		public var url:String;
		public var overview:String;
		public var votes:Number;
		public var rating:Number;
		public var certification:String;
		public var releaseDate:String;
		public var images:ArrayCollection;
		public var version:String;		
		public var lastModifiedAt:String;
	}
}