package com.richardhoppes.moviedb.json
{
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
	}
}