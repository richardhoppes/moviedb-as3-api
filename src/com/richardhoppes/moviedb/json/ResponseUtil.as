package com.richardhoppes.moviedb.json {
	import com.richardhoppes.moviedb.json.ParseUtil;
	import com.richardhoppes.moviedb.json.VOUtil;
	import com.richardhoppes.moviedb.vo.ImageVO;
	import com.richardhoppes.moviedb.vo.LatestVO;
	import com.richardhoppes.moviedb.vo.MovieImdbLookupVO;
	import com.richardhoppes.moviedb.vo.MovieInfoVO;
	import com.richardhoppes.moviedb.vo.MovieSearchVO;
	import com.richardhoppes.moviedb.vo.MovieVO;
	import com.richardhoppes.moviedb.vo.TranslationVO;
	import com.richardhoppes.moviedb.vo.VersionVO;
	
	import mx.collections.ArrayCollection;
	
	/**
	 * Response Utility 
	 * @author richard hoppes
	 * 
	 */	
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
		
		public static function getTranslations(response:String):ArrayCollection {
			var result:ArrayCollection = new ArrayCollection();
			var jsonResult:Object = ParseUtil.decodeAsObject(response);
			
			if(jsonResult.length > 0) {
				for each (var movie:Object in jsonResult) {
					for(var i:Number = 0; i < movie.translations.length; i++) {
						var translationVO:TranslationVO = VOUtil.createTranslationVO(movie.translations[i]);
						result.addItem(translationVO);
					}
				} 
			}
			return result;
		}
		
		public static function getVersion(response:String):ArrayCollection {
			var result:ArrayCollection = new ArrayCollection();
			var jsonResult:Object = ParseUtil.decodeAsObject(response);
			if(jsonResult.length > 0) {
				for each (var version:Object in jsonResult) {
					var versionVO:VersionVO = VOUtil.createVersionVO(version);
					result.addItem(versionVO);
				} 
			}
			return result;
		}
		
		public static function getLatest(response:String):LatestVO {
			var result:LatestVO = new LatestVO();
			var jsonResult:Object = ParseUtil.decodeAsObject(response);
			if(jsonResult.length > 0) {
				result = VOUtil.createLatestVO(jsonResult[0]);
			}
			return result;
		}
	}
}