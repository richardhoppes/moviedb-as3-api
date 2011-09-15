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
		
		public var originalName:String; 
		public var version:String;		
		public var popularity:Number;	
		public var movieType:String;	
		public var translated:Boolean;	
		public var alternativeName:String;
		public var language:String;
		public var imdbId:String;
		public var score:Number;
		public var name:String;
		public var votes:Number;
		public var lastModifiedAt:String;
		public var url:String;
		public var id:String;
		public var releaseDate:String;
		public var overview:String;
		public var adult:Boolean;
		public var rating:Number;
		public var certification:String;
		
		public var posters:ArrayCollection;
		public var backdrops:ArrayCollection;
	}
}