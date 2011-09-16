package com.richardhoppes.moviedb.json {
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
				trace("decodeAsObject: JSON Parse Error");
			} catch (error:Error) {
				trace("decodeAsObject: Error");
			}
			
			if (results.length == 1 && results[0] is String && results[0] == API_RESPONSE_NO_RESULTS) {
				results = new Object();
			} 
			return results;
		}
	}
}