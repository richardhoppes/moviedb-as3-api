package com.richardhoppes.moviedb.vo {
	[RemoteClass(alias="com.richardhoppes.moviedb.vo.CountryVO")]
	
	/**
	 * Country VO 
	 * @author richard hoppes
	 * 
	 */	
	public class CountryVO {
		public function CountryVO() {
			super();
		}
		
		public var url:String;
		public var code:String;
		public var name:String;
	}
}