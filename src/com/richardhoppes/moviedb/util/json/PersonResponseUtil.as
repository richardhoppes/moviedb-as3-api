package com.richardhoppes.moviedb.util.json {
	import com.richardhoppes.moviedb.vo.ImageVO;
	import com.richardhoppes.moviedb.vo.PersonInfoVO;
	import com.richardhoppes.moviedb.vo.PersonLatestVO;
	import com.richardhoppes.moviedb.vo.PersonSearchVO;
	import com.richardhoppes.moviedb.vo.PersonVersionVO;
	
	/**
	 * Response Utility 
	 * @author richard hoppes
	 * 
	 */	
	public class PersonResponseUtil {
		public function PersonResponseUtil() {
		}
		
		public static function personSearch(response:String):Vector.<PersonSearchVO> {
			var result:Vector.<PersonSearchVO> = new Vector.<PersonSearchVO>();
			var jsonResult:Object = ParseUtil.decodeAsObject(response);
			if(jsonResult.length > 0) {
				for each (var person:Object in jsonResult) {
					var personSearchVO:PersonSearchVO = VOUtil.createPersonSearchVO(person);
					result.push(personSearchVO);
				} 
			}
			return result;
		}
		
		public static function getInfo(response:String):PersonInfoVO {
			var result:PersonInfoVO = new PersonInfoVO();
			var jsonResult:Object = ParseUtil.decodeAsObject(response);
			if(jsonResult.length > 0) {
				result = VOUtil.createPersonInfoVO(jsonResult[0]);
			}
			return result;
		}
		
		public static function getVersion(response:String):Vector.<PersonVersionVO> {
			var result:Vector.<PersonVersionVO> = new Vector.<PersonVersionVO>();
			var jsonResult:Object = ParseUtil.decodeAsObject(response);
			if(jsonResult.length > 0) {
				for each (var version:Object in jsonResult) {
					var versionVO:PersonVersionVO = VOUtil.createPersonVersionVO(version);
					result.push(versionVO);
				} 
			}
			return result;
		}
		
		public static function getLatest(response:String):PersonLatestVO {
			var result:PersonLatestVO = new PersonLatestVO();
			var jsonResult:Object = ParseUtil.decodeAsObject(response);
			if(jsonResult.length > 0) {
				result = VOUtil.createPersonLatestVO(jsonResult[0]);
			}
			return result;
		}
		
	}
}