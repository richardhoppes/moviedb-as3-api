package com.richardhoppes.moviedb.util.json {
	import com.adobe.utils.DateUtil;
	import com.richardhoppes.moviedb.util.DataTypeUtil;
	import com.richardhoppes.moviedb.vo.CastVO;
	import com.richardhoppes.moviedb.vo.CountryVO;
	import com.richardhoppes.moviedb.vo.GenreVO;
	import com.richardhoppes.moviedb.vo.ImageVO;
	import com.richardhoppes.moviedb.vo.MovieBrowseVO;
	import com.richardhoppes.moviedb.vo.MovieImdbLookupVO;
	import com.richardhoppes.moviedb.vo.MovieInfoVO;
	import com.richardhoppes.moviedb.vo.MovieLatestVO;
	import com.richardhoppes.moviedb.vo.MovieSearchVO;
	import com.richardhoppes.moviedb.vo.MovieVO;
	import com.richardhoppes.moviedb.vo.MovieVersionVO;
	import com.richardhoppes.moviedb.vo.PersonInfoVO;
	import com.richardhoppes.moviedb.vo.PersonLatestVO;
	import com.richardhoppes.moviedb.vo.PersonSearchVO;
	import com.richardhoppes.moviedb.vo.PersonVO;
	import com.richardhoppes.moviedb.vo.PersonVersionVO;
	import com.richardhoppes.moviedb.vo.StudioVO;
	import com.richardhoppes.moviedb.vo.TranslationVO;
	
	/**
	 * VO Utility  
	 * @author richard hoppes
	 * 
	 */	
	public class VOUtil {
		
		public static function createMovieImdbLookupVO(object:Object):MovieImdbLookupVO {
			var movieImdbLookupVO:MovieImdbLookupVO = MovieImdbLookupVO(VOUtil.createMovieVO(object, new MovieImdbLookupVO()));
			movieImdbLookupVO.runtime = DataTypeUtil.toNumber(object.runtime);
			
			movieImdbLookupVO.genres = new Vector.<MovieImdbLookupVO>();
			for each (var genre:Object in object.genres) {
				movieImdbLookupVO.genres.push(createGenreVO(genre));
			}

			return movieImdbLookupVO;
		}
		
		public static function createMovieSearchVO(object:Object):MovieSearchVO {
			var movieSearchVO:MovieSearchVO = MovieSearchVO(VOUtil.createMovieVO(object, new MovieSearchVO()));
			movieSearchVO.score = DataTypeUtil.toNumber(object.score);
			movieSearchVO.adult = DataTypeUtil.toBoolean(object.adult); 
			return movieSearchVO;
		}
		
		public static function createMovieInfoVO(object:Object):MovieInfoVO {
			
			var movieInfoVO:MovieInfoVO = MovieInfoVO(VOUtil.createMovieVO(object, new MovieInfoVO()));
			
			movieInfoVO.runtime = DataTypeUtil.toNumber(object.runtime);
			movieInfoVO.adult = DataTypeUtil.toBoolean(object.adult); 
			movieInfoVO.tagline = object.tagline;
			movieInfoVO.budget = DataTypeUtil.toNumber(object.budget);
			movieInfoVO.revenue = DataTypeUtil.toNumber(object.revenue);
			movieInfoVO.homepage = object.homepage;
			movieInfoVO.trailer = object.trailer;
			
			movieInfoVO.genres = new Vector.<GenreVO>();
			for each (var genre:Object in object.genres) {
				movieInfoVO.genres.push(createGenreVO(genre));
			}
			
			movieInfoVO.countries = new Vector.<CountryVO>();
			for each (var country:Object in object.countries) {
				movieInfoVO.countries.push(createCountryVO(country));
			}
			
			movieInfoVO.studios = new Vector.<StudioVO>();
			for each (var studio:Object in object.studios) {
				movieInfoVO.studios.push(createStudioVO(studio));
			}
			
			movieInfoVO.people = new Vector.<CastVO>();
			for each (var person:Object in object.cast) {
				movieInfoVO.people.push(createCastVO(person));
			}
			
			return movieInfoVO;
		}
		
		public static function createMovieBrowseVO(object:Object):MovieBrowseVO {
			var movieBrowseVO:MovieBrowseVO = MovieBrowseVO(VOUtil.createMovieVO(object, new MovieBrowseVO()));
			movieBrowseVO.runtime = DataTypeUtil.toNumber(object.runtime);
			movieBrowseVO.adult = DataTypeUtil.toBoolean(object.adult); 
			movieBrowseVO.score = DataTypeUtil.toNumber(object.score);
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
			movieVO.lastModifiedAt = DataTypeUtil.toDate(object.last_modified_at);
			movieVO.url = object.url;
			movieVO.id = object.id;
			movieVO.releaseDate = object.released;
			movieVO.overview = object.overview;
			movieVO.certification = object.certification;
			movieVO.popularity = DataTypeUtil.toNumber(object.popularity);
			movieVO.votes = DataTypeUtil.toNumber(object.votes);
			movieVO.rating = DataTypeUtil.toNumber(object.rating);
			movieVO.translated = DataTypeUtil.toBoolean(object.translated); 
			
			movieVO.images = new Vector.<ImageVO>();
			for each (var poster:Object in object.posters) {
				for each (var posterImage:Object in poster) {
					movieVO.images.push(createImageVO(posterImage));
				}
			}
			for each (var backdrop:Object in object.backdrops) {
				for each (var backdropImage:Object in backdrop) {
					movieVO.images.push(createImageVO(backdropImage));
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
		
		public static function createCastVO(object:Object):CastVO {
			var personVO:CastVO = new CastVO;
			personVO.castId = object.castId;
			personVO.url = object.url;
			personVO.order = DataTypeUtil.toNumber(object.order);
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
			imageVO.height = DataTypeUtil.toNumber(object.height);
			imageVO.width = DataTypeUtil.toNumber(object.width);
			imageVO.size = object.size;
			return imageVO;
		}
		
		public static function createMovieVersionVO(object:Object):MovieVersionVO {
			var versionVO:MovieVersionVO = new MovieVersionVO();
			versionVO.name = object.name;
			versionVO.id = object.id;
			versionVO.imdbId = object.imdb_id;
			versionVO.lastModifiedAt = DataTypeUtil.toDate(object.last_modified_at);
			versionVO.version = object.version;
			return versionVO;
		}
		
		public static function createMovieLatestVO(object:Object):MovieLatestVO {
			var latestVO:MovieLatestVO = new MovieLatestVO();
			latestVO.name = object.name;
			latestVO.id = object.id;
			latestVO.imdbId = object.imdb_id;
			latestVO.lastModifiedAt = DataTypeUtil.toDate(object.last_modified_at);
			latestVO.version = object.version;
			return latestVO;
		}
		
		public static function createPersonInfoVO(object:Object):PersonInfoVO {
			var personInfoVO:PersonInfoVO = PersonInfoVO(VOUtil.createPersonVO(object, new PersonInfoVO()));
			personInfoVO.knownMovies = object.known_movies;
			personInfoVO.birthday = DataTypeUtil.toDate(object.birthday);
			
			personInfoVO.filmography = new Vector.<CastVO>();
			for each (var cast:Object in object.filmography) {
				personInfoVO.filmography.push(createCastVO(cast));
			}
			
			return personInfoVO;
		}

		public static function createPersonSearchVO(object:Object):PersonSearchVO {
			var personSearchVO:PersonSearchVO = PersonSearchVO(VOUtil.createPersonVO(object, new PersonSearchVO()));
			personSearchVO.score = object.score;
			return personSearchVO;
		}
		
		public static function createPersonVO(object:Object, personVO:PersonVO):PersonVO {
			personVO.id = object.id;
			personVO.name = object.name;
			personVO.version = object.version;
			personVO.lastModifiedAt = DataTypeUtil.toDate(object.last_modified_at);
			personVO.url = object.url;
			personVO.popularity = object.popularity;
			personVO.biography = object.biography;
			personVO.images = object.images;		
			personVO.images = new Vector.<ImageVO>();
			for each (var profileImage:Object in object.profile) {
				personVO.images.push(createImageVO(profileImage));
			}
			
			return personVO;
		}
		
		public static function createPersonVersionVO(object:Object):PersonVersionVO {
			var versionVO:PersonVersionVO = new PersonVersionVO();
			versionVO.name = object.name;
			versionVO.id = object.id;
			versionVO.lastModifiedAt = DataTypeUtil.toDate(object.last_modified_at);
			versionVO.version = object.version;
			return versionVO;
		}
		
		public static function createPersonLatestVO(object:Object):PersonLatestVO {
			var latestVO:PersonLatestVO = new PersonLatestVO();
			latestVO.name = object.name;
			latestVO.id = object.id;
			latestVO.lastModifiedAt = DataTypeUtil.toDate(object.last_modified_at);
			latestVO.version = object.version;
			return latestVO;
		}
	}
}