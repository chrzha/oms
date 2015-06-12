package com.oms.backend.utility;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class Utilities {

	public static <T> List<Map<String, T>> camelcase(List<Map<String, T>> list) {
		for (Map<String, T> elem : list) {
			camelcase(elem);
		}

		return list;
	}

	public static <T> Map<String, T> camelcase(Map<String, T> map) {
		Map<String, String> oldNewKeys = new HashMap<String, String>();
		for (Entry<String, T> entry : map.entrySet()) {
			String key = entry.getKey();
			String newKey = camelcase(key);
			if (!newKey.equals(key)) {
				oldNewKeys.put(key, newKey);
			}
		}

		for (Entry<String, String> entry : oldNewKeys.entrySet()) {
			String oldKey = entry.getKey();
			String newKey = entry.getValue();
			map.put(newKey, map.get(oldKey));
			map.remove(oldKey);
		}

		return map;
	}

	public static String camelcase(String name) {
		int index = name.indexOf("_");
		if (index >= 0) {
			String newName = null;
			if (index == name.length() - 1) {
				newName = name.substring(0, index);
			} else {
				newName = name.substring(0, index)
						+ name.substring(index + 1, index + 2).toUpperCase()
						+ name.substring(index + 2);
			}
			return camelcase(newName);
		} else {
			return name;
		}
	}

	public static void p(Object o) {
		System.out.println("["
				+ new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS")
						.format(new Date()) + "] " + o.toString());
	}

	public static void main(String[] args) {
		System.out.println(camelcase("camel_case_test"));
		System.out.println(camelcase("camel_c"));
		System.out.println(camelcase("camel_"));
		System.out.println(camelcase("camel"));
	}

}
