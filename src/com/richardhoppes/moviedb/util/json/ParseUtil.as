package com.richardhoppes.moviedb.util.json {
	import com.adobe.serialization.json.JSON;
	import com.adobe.serialization.json.JSONParseError;
	
	/**
	 * Parse Utility 
	 * @author richard hoppes
	 * 
	 */	
	public class ParseUtil {
		protected static const API_RESPONSE_NO_RESULTS:String = "Nothing found.";
		
		public static function decodeAsObject(response:String):Object {
			var results:Object = new Object();
			try {
				results = JSON.decode(response, true);
			} catch (error:JSONParseError) {
				//TODO: Throw error
				trace("decodeAsObject: JSON Parse Error");
			} catch (error:Error) {
				//TODO: Throw error
				trace("decodeAsObject: Error");
			}
			
			if (results.length == 1 && results[0] is String && results[0] == API_RESPONSE_NO_RESULTS) {
				results = new Object();
			} 
			return results;
		}
	}
}