package util;

public class StringUtils {
	public static boolean isEmpty(String str) {
		return null == str||str.equals("")||str.matches("\\s*");
		
	}
	
	public static String defaultValue(String content,String defaultValue) {
		if(isEmpty(content)) {
			return defaultValue;
		}
		return content;
	}
	
	/*
	 * 改数据库字段名改为驼峰方式
	 * @param column
	 * @return
	 */
	public static String columnToProperty(String column) {
		//If string is empty then return empty string
		if(isEmpty(column)) return "";
		//Get the length of string
		Byte length=(byte)column.length();
		
		StringBuilder sb=new StringBuilder(length);
		int i=0;
		//loop every character
		for(int j=0;j<length;j++) {
			//Match the first
			if(column.charAt(j)=='_') {
				//如果后面还有_,也就是连续的_,那么j就需要自增一个单位，直到后面不是_为止
				while(column.charAt(j+1)=='_') {
					j+=1;
				}
				sb.append((""+column.charAt(++j)).toUpperCase());
			}
			else {
				//如果循环到的字符不是_,那么就保存下来
				sb.append(column.charAt(j));
			}
		}
		return sb.toString();
	}
	
	/*
	 * Change to the upper character
	 * @param str
	 * @return
	 */
	public static String upperCaseFirstCharacter(String str) {
		StringBuilder sb=new StringBuilder();
		char[] arr=str.toCharArray();
		for(int i=0;i<arr.length;i++) {
			if(i==0)sb.append((arr[i]+"").toUpperCase());
			else sb.append((arr[i]+""));
		}
		return sb.toString();
	}
}
