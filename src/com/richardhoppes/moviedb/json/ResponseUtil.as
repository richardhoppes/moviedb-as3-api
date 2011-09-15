package com.richardhoppes.moviedb.json {
	import com.richardhoppes.moviedb.json.VOUtil;
	import com.richardhoppes.moviedb.json.ParseUtil;
	import com.richardhoppes.moviedb.vo.MovieVO;
	import com.richardhoppes.moviedb.vo.ImageVO;
	
	import mx.collections.ArrayCollection;
	
	public class ResponseUtil {
		public function ResponseUtil() {
		}
		
		public static function movieSearch(response:String):ArrayCollection {
			var result:ArrayCollection = new ArrayCollection();
			var jsonResult:Object = ParseUtil.decodeAsObject(response);

			if(jsonResult.length > 0) {
				for each (var movie:Object in jsonResult) {
					var movieVO:MovieVO = VOUtil.createMovieVO(movie);
					result.addItem(movieVO);
				} 
			}
			return result;
		}
	}
}