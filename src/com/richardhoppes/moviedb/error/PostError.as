package com.richardhoppes.moviedb.error {
	
	/**
	 * Error encountered while performing a post operation
	 * @author richard hoppes
	 * 
	 */	
	public class PostError extends Error {

		public function PostError(message:String, id:*=0) {
			super(message, id);
		}
	}
}