package com.richardhoppes.moviedb.json {
	import com.richardhoppes.moviedb.vo.CountryVO;
	import com.richardhoppes.moviedb.vo.GenreVO;
	import com.richardhoppes.moviedb.vo.ImageVO;
	import com.richardhoppes.moviedb.vo.LatestMovieVO;
	import com.richardhoppes.moviedb.vo.BrowseMovieVO;
	import com.richardhoppes.moviedb.vo.ImdbMovieLookupVO;
	import com.richardhoppes.moviedb.vo.MovieInfoVO;
	import com.richardhoppes.moviedb.vo.MovieSearchVO;
	import com.richardhoppes.moviedb.vo.MovieVO;
	import com.richardhoppes.moviedb.vo.PersonVO;
	import com.richardhoppes.moviedb.vo.MovieStudioVO;
	import com.richardhoppes.moviedb.vo.MovieTranslationVO;
	import com.richardhoppes.moviedb.vo.MovieVersionVO;
	
	import mx.collections.ArrayCollection;
	
	/**
	 * VO Utility  
	 * @author richard hoppes
	 * 
	 */	
	public class VOUtil {
		
		public static function createImdbMovieLookupVO(object:Object):ImdbMovieLookupVO {
			var movieImdbLookupVO:ImdbMovieLookupVO = ImdbMovieLookupVO(VOUtil.createMovieVO(object, new ImdbMovieLookupVO()));
			movieImdbLookupVO.runtime = DataTypeUtil.handleNumber(object.runtime);
			
			movieImdbLookupVO.genres = new ArrayCollection();
			for each (var genre:Object in object.genres) {
				movieImdbLookupVO.genres.addItem(createGenreVO(genre));
			}

			return movieImdbLookupVO;
		}
		
		public static function createMovieSearchVO(object:Object):MovieSearchVO {
			var movieSearchVO:MovieSearchVO = MovieSearchVO(VOUtil.createMovieVO(object, new MovieSearchVO()));
			movieSearchVO.score = DataTypeUtil.handleNumber(object.score);
			movieSearchVO.adult = DataTypeUtil.handleBoolean(object.adult); 
			return movieSearchVO;
		}
		
		public static function createMovieInfoVO(object:Object):MovieInfoVO {
			
			var movieInfoVO:MovieInfoVO = MovieInfoVO(VOUtil.createMovieVO(object, new MovieInfoVO()));
			
			movieInfoVO.runtime = DataTypeUtil.handleNumber(object.runtime);
			movieInfoVO.adult = DataTypeUtil.handleBoolean(object.adult); 
			movieInfoVO.tagline = object.tagline;
			movieInfoVO.budget = DataTypeUtil.handleNumber(object.budget);
			movieInfoVO.revenue = DataTypeUtil.handleNumber(object.revenue);
			movieInfoVO.homepage = object.homepage;
			movieInfoVO.trailer = object.trailer;
			
			movieInfoVO.genres = new ArrayCollection();
			for each (var genre:Object in object.genres) {
				movieInfoVO.genres.addItem(createGenreVO(genre));
			}
			
			movieInfoVO.countries = new ArrayCollection();
			for each (var country:Object in object.countries) {
				movieInfoVO.countries.addItem(createCountryVO(country));
			}
			
			movieInfoVO.studios = new ArrayCollection();
			for each (var studio:Object in object.studios) {
				movieInfoVO.studios.addItem(createMovieStudioVO(studio));
			}
			
			movieInfoVO.people = new ArrayCollection();
			for each (var person:Object in object.cast) {
				movieInfoVO.people.addItem(createPersonVO(person));
			}
			
			return movieInfoVO;
		}
		
		public static function createBrowseMovieVO(object:Object):BrowseMovieVO {
			var movieBrowseVO:BrowseMovieVO = BrowseMovieVO(VOUtil.createMovieVO(object, new BrowseMovieVO()));
			movieBrowseVO.runtime = DataTypeUtil.handleNumber(object.runtime);
			movieBrowseVO.adult = DataTypeUtil.handleBoolean(object.adult); 
			movieBrowseVO.score = DataTypeUtil.handleNumber(object.score);
			return movieBrowseVO;
		}
		
		public static function createMovieVO(object:Object, movieVO:MovieVO):MovieVO {
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
			movieVO.votes = DataTypeUtil.handleNumber(object.votes);
			movieVO.rating = DataTypeUtil.handleNumber(object.rating);
			movieVO.translated = DataTypeUtil.handleBoolean(object.translated); 
			
			movieVO.images = new ArrayCollection();
			for each (var poster:Object in object.posters) {
				for each (var posterImage:Object in poster) {
					movieVO.images.addItem(createImageVO(posterImage));
				}
			}
			for each (var backdrop:Object in object.backdrops) {
				for each (var backdropImage:Object in backdrop) {
					movieVO.images.addItem(createImageVO(backdropImage));
				}
			}

			return movieVO;
		}
		
		public static function createGenreVO(object:Object):GenreVO {
			var genreVO:GenreVO = new GenreVO;
			genreVO.url = object.url;
			genreVO.name = object.name;
			genreVO.type = object.type;
			genreVO.id = object.id;
			return genreVO;
		}
		
		public static function createPersonVO(object:Object):PersonVO {
			var personVO:PersonVO = new PersonVO;
			personVO.castId = object.castId;
			personVO.url = object.url;
			personVO.order = DataTypeUtil.handleNumber(object.order);
			personVO.character = object.character;
			personVO.name = object.name;
			personVO.profile = object.profile;
			personVO.job = object.job;
			personVO.id = object.id;
			personVO.department = object.department;
			return personVO;
		}
		
		public static function createMovieStudioVO(object:Object):MovieStudioVO {
			var studioVO:MovieStudioVO = new MovieStudioVO;
			studioVO.url = object.url;
			studioVO.name = object.name;
			studioVO.id = object.id;
			return studioVO;
		}
		
		public static function createCountryVO(object:Object):CountryVO {
			var countryVO:CountryVO = new CountryVO;
			countryVO.url = object.url;
			countryVO.code = object.code;
			countryVO.name = object.name;
			return countryVO;
		}
		
		public static function createMovieTranslationVO(object:Object):MovieTranslationVO {
			var translationVO:MovieTranslationVO = new MovieTranslationVO;
			translationVO.englishName = object.english_name;
			translationVO.nativeName = object.native_name;
			translationVO.iso639_1 = object.iso_639_1;
			return translationVO;
		}
		
		public static function createImageVO(object:Object):ImageVO {
			var imageVO:ImageVO = new ImageVO();
			imageVO.id = object.id;
			imageVO.url = object.url;
			imageVO.type = object.type;
			imageVO.height = DataTypeUtil.handleNumber(object.height);
			imageVO.width = DataTypeUtil.handleNumber(object.width);
			imageVO.size = object.size;
			return imageVO;
		}
		
		public static function createMovieVersionVO(object:Object):MovieVersionVO {
			var versionVO:MovieVersionVO = new MovieVersionVO();
			versionVO.name = object.name;
			versionVO.id = object.id;
			versionVO.imdbId = object.imdb_id;
			versionVO.lastModifiedAt = object.last_modified_at;
			versionVO.version = object.version;
			return versionVO;
		}
		
		public static function createLatestMovieVO(object:Object):LatestMovieVO {
			var latestVO:LatestMovieVO = new LatestMovieVO();
			latestVO.name = object.name;
			latestVO.id = object.id;
			latestVO.imdbId = object.imdb_id;
			latestVO.lastModifiedAt = object.last_modified_at;
			latestVO.version = object.version;
			return latestVO;
		}
		
	}
}