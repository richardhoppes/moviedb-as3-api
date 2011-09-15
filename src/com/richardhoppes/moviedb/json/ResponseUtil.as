package com.richardhoppes.moviedb.json {
	import com.richardhoppes.moviedb.json.ParseUtil;
	import com.richardhoppes.moviedb.json.VOUtil;
	import com.richardhoppes.moviedb.vo.ImageVO;
	import com.richardhoppes.moviedb.vo.MovieImdbLookupVO;
	import com.richardhoppes.moviedb.vo.MovieInfoVO;
	import com.richardhoppes.moviedb.vo.MovieSearchVO;
	import com.richardhoppes.moviedb.vo.MovieVO;
	
	import mx.collections.ArrayCollection;
	
	public class ResponseUtil {
		public function ResponseUtil() {
		}
		
		public static function movieSearch(response:String):ArrayCollection {
			var result:ArrayCollection = new ArrayCollection();
			var jsonResult:Object = ParseUtil.decodeAsObject(response);

			if(jsonResult.length > 0) {
				for each (var movie:Object in jsonResult) {
					var movieVO:MovieSearchVO = VOUtil.createMovieSearchVO(movie);
					result.addItem(movieVO);
				} 
			}
			return result;
		}
		
		public static function imdbLookup(response:String):ArrayCollection {
			var result:ArrayCollection = new ArrayCollection();
			var jsonResult:Object = ParseUtil.decodeAsObject(response);
			
			if(jsonResult.length > 0) {
				for each (var movie:Object in jsonResult) {
					var movieVO:MovieImdbLookupVO = VOUtil.createMovieImdbLookupVO(movie);
					result.addItem(movieVO);
				} 
			}
			return result;
		}
		
		public static function getInfo(response:String):ArrayCollection {
			var result:ArrayCollection = new ArrayCollection();
			var jsonResult:Object = ParseUtil.decodeAsObject(response);
			
			if(jsonResult.length > 0) {
				for each (var movie:Object in jsonResult) {
					var movieVO:MovieInfoVO = VOUtil.createMovieInfoVO(movie);
					result.addItem(movieVO);
				} 
			}
			return result;
		}
	}
}