package com.richardhoppes.moviedb.vo {

	[RemoteClass(alias="com.richardhoppes.moviedb.vo.PersonSearchVO")]
	
	/**
	 * Person Search VO 
	 * @author richard hoppes
	 * 
	 */	
	public class PersonSearchVO extends PersonVO {
		public function PersonSearchVO() {
			super();
		}

		public var score:Number;
	}
}