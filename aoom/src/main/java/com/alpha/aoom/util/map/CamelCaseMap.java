package com.alpha.aoom.util.map;

import java.util.HashMap;

public class CamelCaseMap extends HashMap<String, Object> {

	@Override
	public Object put(String key, Object value) {
		return super.put(convertToCamelCase(key), value);
	}

	private String convertToCamelCase(String input) {
		
		StringBuilder result = new StringBuilder();

        boolean nextUpperCase = false;
        for (char c : input.toCharArray()) {
            if (c == '_') {
                nextUpperCase = true;
            } else {
                if (nextUpperCase) {
                    result.append(Character.toUpperCase(c));
                    nextUpperCase = false;
                } else {
                    result.append(Character.toLowerCase(c));
                }
            }
        }
        
		// 람다식 내부에서는 외부의 지역변수(stack 에 저장)를 변경할수 가 없음
		// java8 이상에서는 final 또는 effectively final 인 변수 변경가능
//		boolean[] nextUpperCase = { false }; // 배열로 감싸서 람다식 내부에서 값을 변경할 수 있도록 함
//		input.chars().forEach(c -> {
//			if (c == '_') {
//				nextUpperCase[0] = true;
//			} else {
//				result.append(nextUpperCase[0] ? Character.toUpperCase((char) c) : Character.toLowerCase((char) c));
//				nextUpperCase[0] = false;
//			}
//		});

		return result.toString();
	}

}
