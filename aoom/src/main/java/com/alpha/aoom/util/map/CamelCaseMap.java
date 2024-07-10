package com.alpha.aoom.util.map;

import java.util.HashMap;

public class CamelCaseMap extends HashMap<String, Object> {

	@Override
	public Object put(String key, Object value) {
		return super.put(convertToCamelCase(key), value);
	}

	private String convertToCamelCase(String input) {
		
		// 조작이 유용한 String으로 선언
		StringBuilder result = new StringBuilder();

        boolean nextUpperCase = false;
        // 언더바를 찾아서 언더바인 다음 문자를 대문자로 변경 그렇지 않은 것은 다 소문자로 변경
        for (char c : input.toCharArray()) {
            if (c == '_') { // 언더바 찾기
                nextUpperCase = true;
            } else {
                if (nextUpperCase) {
                    result.append(Character.toUpperCase(c)); // 대문자로변경
                    nextUpperCase = false;
                } else {
                    result.append(Character.toLowerCase(c)); // 소문자로 변경
                }
            }
        }
        
		return result.toString();
	}

}
