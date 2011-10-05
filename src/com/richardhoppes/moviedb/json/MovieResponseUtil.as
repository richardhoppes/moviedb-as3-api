package com.richardhoppes.moviedb.json {
	import com.richardhoppes.moviedb.vo.ImageVO;
	import com.richardhoppes.moviedb.vo.MovieLatestVO;
	import com.richardhoppes.moviedb.vo.MovieBrowseVO;
	import com.richardhoppes.moviedb.vo.MovieImdbLookupVO;
	import com.richardhoppes.moviedb.vo.MovieInfoVO;
	import com.richardhoppes.moviedb.vo.MovieSearchVO;
	import com.richardhoppes.moviedb.vo.MovieVO;
	import com.richardhoppes.moviedb.vo.TranslationVO;
	import com.richardhoppes.moviedb.vo.MovieVersionVO;
	
	import mx.collections.ArrayCollection;
	
	/**
	 * Response Utility 
	 * @author richard hoppes
	 * 
	 */	
	public class MovieResponseUtil {
		public function MovieResponseUtil() {
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
		
		public static function getTranslations(response:String):ArrayCollection {
			var result:ArrayCollection = new ArrayCollection();
			var jsonResult:Object = ParseUtil.decodeAsObject(response);
			if(jsonResult.length > 0) {
				for(var i:Number = 0; i < jsonResult[0].translations.length; i++) {
					var translationVO:TranslationVO = VOUtil.createTranslationVO(jsonResult[0].translations[i]);
					result.addItem(translationVO);
				}
			}
			return result;
		}
		
		public static function getVersion(response:String):ArrayCollection {
			var result:ArrayCollection = new ArrayCollection();
			var jsonResult:Object = ParseUtil.decodeAsObject(response);
			if(jsonResult.length > 0) {
				for each (var version:Object in jsonResult) {
					var versionVO:MovieVersionVO = VOUtil.createMovieVersionVO(version);
					result.addItem(versionVO);
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
		
		public static function getImages(response:String):ArrayCollection {
			var results:ArrayCollection = new ArrayCollection();
			var jsonResult:Object = ParseUtil.decodeAsObject(response);
			if(jsonResult.length > 0) {
				for each (var poster:Object in jsonResult[0].posters) {
					for each (var posterImage:Object in poster) {
						results.addItem(VOUtil.createImageVO(posterImage));
					}
				}
				for each (var backdrop:Object in jsonResult[0].backdrops) {
					for each (var backdropImage:Object in backdrop) {
						results.addItem(VOUtil.createImageVO(backdropImage));
					}
				}
			}
			return results;
		}
		
		public static function browse(response:String):ArrayCollection {
			var result:ArrayCollection = new ArrayCollection();
			var jsonResult:Object = ParseUtil.decodeAsObject(response);
			if(jsonResult.length > 0) {
				for each (var movie:Object in jsonResult) {
					var movieVO:MovieBrowseVO = VOUtil.createMovieBrowseVO(movie);
					result.addItem(movieVO);
				} 
			}
			return result;
		}
	}
}