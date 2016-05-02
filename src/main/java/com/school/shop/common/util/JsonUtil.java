package com.school.shop.common.util;

import org.codehaus.jackson.JsonParser;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.ser.CustomSerializerFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class JsonUtil {
    private final static Logger logger = LoggerFactory.getLogger(JsonUtil.class);

    private static ObjectMapper mapper = new ObjectMapper();
	public static SimpleDateFormat dateFm = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");
	private static CustomSerializerFactory serializerFactory = new CustomSerializerFactory();

	static {
		mapper.configure(JsonParser.Feature.ALLOW_UNQUOTED_CONTROL_CHARS, true);
		mapper.configure(JsonParser.Feature.ALLOW_SINGLE_QUOTES, true);
		mapper.configure(
				JsonParser.Feature.ALLOW_BACKSLASH_ESCAPING_ANY_CHARACTER, true);
		mapper.configure(
				org.codehaus.jackson.map.DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES,
				false);
		mapper.setSerializationConfig(mapper.getSerializationConfig()
				.withDateFormat(dateFm));
		mapper.setSerializerFactory(serializerFactory);
	}

	public static <T> T fromJson(String jsonAsString, Class<T> pojoClass)
			throws IOException {
//        long begin = System.currentTimeMillis();
        T result = mapper.readValue(jsonAsString, pojoClass);
//        long end = System.currentTimeMillis();
//        logger.info("fromJson costs {} ms", (end - begin));
        return result;
	}

	public static String toJson(Object object) throws IOException {
//        long begin = System.currentTimeMillis();
        String result = mapper.writeValueAsString(object);
//        long end = System.currentTimeMillis();
//        logger.info("toJson costs {} ms", (end - begin));
        return result;
	}

	public static String buildResponeJson(Object object) {
		String json = "";
		try {
			return toJson(object);
		} catch (IOException e) {
		}
		return json;

	}
	public static String getTimeStamp() {
		return DateUtil.formatDate(new java.util.Date(),
				DateUtil.COMMON_PATTERN);
	}

	public static String getTimeStamp(Date date) {
		return DateUtil.formatDate(date, DateUtil.COMMON_PATTERN);
	}

}
