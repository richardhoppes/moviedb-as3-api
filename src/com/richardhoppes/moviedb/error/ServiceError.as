package com.richardhoppes.moviedb.error {
	
	/**
	 * Service Error 
	 * @author richard hoppes
	 * 
	 */	
	public class ServiceError extends Error
	{
		public function ServiceError(message:String, id:*=0) {
			super(message, id);
		}
	}
}