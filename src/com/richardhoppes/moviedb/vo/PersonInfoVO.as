package com.richardhoppes.moviedb.vo {
	import mx.collections.ArrayCollection;

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
		public var birthday:String;	
		public var birthplace:String;
		public var filmography:ArrayCollection;	// Collection of cast objects
		
		//TODO: known_as (collection) (?)
	}
}