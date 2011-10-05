package com.richardhoppes.moviedb.vo {
	[RemoteClass(alias="com.richardhoppes.moviedb.vo.PersonInfoVO")]
	
	/**
	 * Person Info VO 
	 * @author richard hoppes
	 * 
	 */	
	public class PersonInfoVO extends PersonVO {
		public function PersonInfoVO() {
			super();
		}
		
		public var knownMovies:Number;
		public var birthday:Date;	
		public var birthplace:String;
		public var filmography:Vector.<CastVO>;	// Collection of cast objects
		
		//TODO: known_as (collection) (?)
	}
}