package com.richardhoppes.moviedb.util.json {
	import com.richardhoppes.moviedb.vo.GenreVO;
	
	import mx.collections.ArrayCollection;
	
	/**
	 * Response Utility 
	 * @author richard hoppes
	 * 
	 */	
	public class GenreResponseUtil {
		public function GenreResponseUtil() {
		}
		
		public static function getList(response:String):ArrayCollection {
			var result:ArrayCollection = new ArrayCollection();
			var jsonResult:Object = ParseUtil.decodeAsObject(response);
			if(jsonResult.length > 0) {
				for each (var genre:Object in jsonResult) {
					if(genre.name != null) {
						var genreVO:GenreVO = VOUtil.createGenreVO(genre);
						result.addItem(genreVO);
					}
				} 
			}
			return result;
		}
	}
}