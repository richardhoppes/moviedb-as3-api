package com.richardhoppes.moviedb.vo {
	[RemoteClass(alias="com.richardhoppes.moviedb.vo.TranslationVO")]
	/**
	 * Translation VO 
	 * @author richard hoppes
	 * 
	 */	
	public class TranslationVO {
		public function TranslationVO() {
			super();
		}
		
		public var englishName:String;
		public var nativeName:String;
		public var iso639_1:String;
	}
}