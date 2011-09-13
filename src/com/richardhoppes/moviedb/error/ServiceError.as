package com.richardhoppes.moviedb.error
{
	public class ServiceError extends Error
	{
		public function ServiceError(message:String, id:*=0) {
			super(message, id);
		}
	}
}