package com.richardhoppes.moviedb.json {
	import com.richardhoppes.moviedb.json.DataTypeUtil;
	import com.richardhoppes.moviedb.vo.CountryVO;
	import com.richardhoppes.moviedb.vo.GenreVO;
	import com.richardhoppes.moviedb.vo.ImageVO;
	import com.richardhoppes.moviedb.vo.MovieImdbLookupVO;
	import com.richardhoppes.moviedb.vo.MovieInfoVO;
	import com.richardhoppes.moviedb.vo.MovieSearchVO;
	import com.richardhoppes.moviedb.vo.MovieVO;
	import com.richardhoppes.moviedb.vo.PersonVO;
	import com.richardhoppes.moviedb.vo.StudioVO;
	import com.richardhoppes.moviedb.vo.TranslationVO;
	
	import mx.collections.ArrayCollection;
	
	public class VOUtil {
		
		public static function createMovieImdbLookupVO(object:Object):MovieImdbLookupVO {
			var movieImdbLookupVO:MovieImdbLookupVO = MovieImdbLookupVO(VOUtil.createMovieVO(object, new MovieImdbLookupVO()));
			movieImdbLookupVO.runtime = DataTypeUtil.handleNumber(object.runtime);
			
			for each (var genre:Object in object.genres) {
				movieImdbLookupVO.images.addItem(createGenreVO(genre));
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
				movieInfoVO.studios.addItem(createStudioVO(studio));
			}
			
			movieInfoVO.people = new ArrayCollection();
			for each (var person:Object in object.cast) {
				movieInfoVO.people.addItem(createPersonVO(person));
			}
			
			return movieInfoVO;
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
			
			// Images
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
		
		public static function createStudioVO(object:Object):StudioVO {
			var studioVO:StudioVO = new StudioVO;
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
		
		public static function createTranslationVO(object:Object):TranslationVO {
			var translationVO:TranslationVO = new TranslationVO;
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
		
	}
}