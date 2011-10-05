package com.richardhoppes.moviedb.json {
	import com.adobe.utils.DateUtil;

	/**
	 * Data Type Utility 
	 * @author richard hoppes
	 * 
	 */	
	public class DataTypeUtil {
		public static function handleBoolean(value:*):Boolean {
			if (value != null && value != "") {
				if (value is Boolean)
					return value;
				else if (value is Number || value is int && value == 1) 
					return true;
				else if (value is String && value.toLowerCase() == "true")  
					return true; 
			}
			return false;
		}
		
		public static function handleNumber(value:*):Number {
			if (value != null && value != "") 
				return value;
			return -1;
		}
		
		public static function handleDate(value:*):Date {
			if(value != null && value != "") {
				if(value is Date)
					return value;
				// Strings returned by TMDb are formatted Y-m-d H:i:s or Y-m-d
				// TODO: GOD, THERE MUST BE A BETTER WAY TO ACCOMPLISH THIS IN AS3...
				else if(value is String) {
					var timeDate:Array = value.split(" ");
					var dateParts:Array = timeDate[0].split('-');
					return new Date(dateParts[0], dateParts[1] - 1, dateParts[2]);
				}
			}
			return null;
		}
	}
}