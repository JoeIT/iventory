<?php

class App_Util_String
{
	// Convert a simple array to a string with separators
	public function arrayToString($array, $separator)
	{
		$string = '';
		
		for($i = 0; $i < count($array); $i++)
		{
			if(($i + 1) < count($array))
				$string .= $array[$i] . $separator;
			else
				$string .= $array[$i];
		}
		
		return $string;
	}
	
	// Convert a string with separators to a array
	public function stringToArray($string, $separator)
	{
		return explode($separator, $string);
	}
	
	public function stringToArrayIgnore($string, $separator, $ignoreList, $minLength) {
		$splitedList = explode($separator, $string);
		$resultList = array();
		foreach($splitedList as $value) {
			if(!in_array($value, $resultList) && !in_array($value, $ignoreList) && strlen($value) >= $minLength) {
				$resultList[] = $value;
			}
		}
		return $resultList;
	}
	
	public function arrayConcat($array1, $array2) {
		foreach($array2 as $value) {
			$array1[] = $value;
		}
		return $array1;
	}

}

?>