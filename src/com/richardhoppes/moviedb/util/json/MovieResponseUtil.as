package com.richardhoppes.moviedb.util.json {
	import com.richardhoppes.moviedb.vo.ImageVO;
	import com.richardhoppes.moviedb.vo.MovieBrowseVO;
	import com.richardhoppes.moviedb.vo.MovieImdbLookupVO;
	import com.richardhoppes.moviedb.vo.MovieInfoVO;
	import com.richardhoppes.moviedb.vo.MovieLatestVO;
	import com.richardhoppes.moviedb.vo.MovieSearchVO;
	import com.richardhoppes.moviedb.vo.MovieVO;
	import com.richardhoppes.moviedb.vo.MovieVersionVO;
	import com.richardhoppes.moviedb.vo.TranslationVO;
	
	/**
	 * Response Utility 
	 * @author richard hoppes
	 * 
	 */	
	public class MovieResponseUtil {
		public function MovieResponseUtil() {
		}
		
		public static function movieSearch(response:String):Vector.<MovieSearchVO> {
			var result:Vector.<MovieSearchVO> = new Vector.<MovieSearchVO>();
			var jsonResult:Object = ParseUtil.decodeAsObject(response);
			if(jsonResult.length > 0) {
				for each (var movie:Object in jsonResult) {
					var movieVO:MovieSearchVO = VOUtil.createMovieSearchVO(movie);
					result.push(movieVO);
				} 
			}
			return result;
		}
		
		public static function imdbLookup(response:String):MovieImdbLookupVO {
			var result:MovieImdbLookupVO = new MovieImdbLookupVO();
			var jsonResult:Object = ParseUtil.decodeAsObject(response);
			if(jsonResult.length > 0) {
				result = VOUtil.createMovieImdbLookupVO(jsonResult[0]);
			}
			return result;
		}
		
		public static function getInfo(response:String):MovieInfoVO {
			var result:MovieInfoVO = new MovieInfoVO;
			var jsonResult:Object = ParseUtil.decodeAsObject(response);
			if(jsonResult.length > 0) {
				result = VOUtil.createMovieInfoVO(jsonResult[0]);
			}
			return result;
		}
		
		public static function getTranslations(response:String):Vector.<TranslationVO> {
			var result:Vector.<TranslationVO> = new Vector.<TranslationVO>();
			var jsonResult:Object = ParseUtil.decodeAsObject(response);
			if(jsonResult.length > 0) {
				for(var i:Number = 0; i < jsonResult[0].translations.length; i++) {
					var translationVO:TranslationVO = VOUtil.createTranslationVO(jsonResult[0].translations[i]);
					result.push(translationVO);
				}
			}
			return result;
		}
		
		public static function getVersion(response:String):Vector.<MovieVersionVO> {
			var result:Vector.<MovieVersionVO> = new Vector.<MovieVersionVO>();
			var jsonResult:Object = ParseUtil.decodeAsObject(response);
			if(jsonResult.length > 0) {
				for each (var version:Object in jsonResult) {
					var versionVO:MovieVersionVO = VOUtil.createMovieVersionVO(version);
					result.push(versionVO);
				} 
			}
			return result;
		}
		
		public static function getLatest(response:String):MovieLatestVO {
			var result:MovieLatestVO = new MovieLatestVO();
			var jsonResult:Object = ParseUtil.decodeAsObject(response);
			if(jsonResult.length > 0) {
				result = VOUtil.createMovieLatestVO(jsonResult[0]);
			}
			return result;
		}
		
		public static function getImages(response:String):Vector.<ImageVO> {
			var results:Vector.<ImageVO> = new Vector.<ImageVO>();
			var jsonResult:Object = ParseUtil.decodeAsObject(response);
			if(jsonResult.length > 0) {
				for each (var poster:Object in jsonResult[0].posters) {
					for each (var posterImage:Object in poster) {
						results.push(VOUtil.createImageVO(posterImage));
					}
				}
				for each (var backdrop:Object in jsonResult[0].backdrops) {
					for each (var backdropImage:Object in backdrop) {
						results.push(VOUtil.createImageVO(backdropImage));
					}
				}
			}
			return results;
		}
		
		public static function browse(response:String):Vector.<MovieBrowseVO> {
			var result:Vector.<MovieBrowseVO> = new Vector.<MovieBrowseVO>();
			var jsonResult:Object = ParseUtil.decodeAsObject(response);
			if(jsonResult.length > 0) {
				for each (var movie:Object in jsonResult) {
					var movieVO:MovieBrowseVO = VOUtil.createMovieBrowseVO(movie);
					result.push(movieVO);
				} 
			}
			return result;
		}
	}
}