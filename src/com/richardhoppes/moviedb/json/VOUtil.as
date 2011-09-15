package com.richardhoppes.moviedb.json {
	import com.richardhoppes.moviedb.json.DataTypeUtil;
	import com.richardhoppes.moviedb.vo.ImageVO;
	import com.richardhoppes.moviedb.vo.MovieVO;
	
	import mx.collections.ArrayCollection;
	
	public class VOUtil {
		public function VOUtil()
		{
		}
		
		public static function createMovieVO(object:Object):MovieVO {
			var movieVO:MovieVO = new MovieVO();
			movieVO.originalName = object.original_name;
			movieVO.version = object.version;
			movieVO.movieType = object.movie_type;
			movieVO.alternativeName = object.alternative_name;
			movieVO.language = object.language;
			movieVO.imdbId = object.imdb_id;
			movieVO.name = object.name;			
			movieVO.lastModifiedAt = object.last_modified_at;
			movieVO.url = object.url;
			movieVO.id = object.id;
			movieVO.releaseDate = object.released;
			movieVO.overview = object.overview;
			movieVO.certification = object.certification;
			movieVO.popularity = DataTypeUtil.handleNumber(object.popularity);
			movieVO.score = DataTypeUtil.handleNumber(object.score);
			movieVO.votes = DataTypeUtil.handleNumber(object.votes);
			movieVO.rating = DataTypeUtil.handleNumber(object.rating);
			movieVO.translated = DataTypeUtil.handleBoolean(object.translated); 
			movieVO.adult = DataTypeUtil.handleBoolean(object.adult);
			
			movieVO.posters = new ArrayCollection();
			for each (var poster:Object in object.posters) {
				for each (var posterImage:Object in poster) {
					movieVO.posters.addItem(createImageVO(posterImage));
				}
			}
			
			movieVO.backdrops = new ArrayCollection();
			for each (var backdrop:Object in object.backdrops) {
				for each (var backdropImage:Object in backdrop) {
					movieVO.backdrops.addItem(createImageVO(backdropImage));
				}
			}
			
			return movieVO;
		}
		
		public static function createImageVO(object:Object):ImageVO {
			var imageVO:ImageVO = new ImageVO();
			imageVO.id = object.id;
			imageVO.url = object.url;
			imageVO.type = object.type;
			imageVO.height = DataTypeUtil.handleNumber(object.height);
			imageVO.width = DataTypeUtil.handleNumber(object.width);
			imageVO.size = DataTypeUtil.handleNumber(object.size);
			return imageVO;
		}
		
	}
}