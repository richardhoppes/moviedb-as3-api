package com.richardhoppes.moviedb.vo {
	[RemoteClass(alias="com.richardhoppes.moviedb.vo.MovieTranslationVO")]
	
	/**
	 * Movie Translation VO 
	 * @author richard hoppes
	 * 
	 */	
	public class MovieTranslationVO {
		public function MovieTranslationVO() {
			super();
		}
		
		public var englishName:String;
		public var nativeName:String;
		public var iso639_1:String;
	}
}