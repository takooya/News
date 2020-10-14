package cn.kgc.util;

public class Secret {
    public static String toSecret(String str) {
        String newStr = null;
        char[] oldChars = str.toCharArray();
        for (char newChar : oldChars) {
            newChar = (char) (((int) newChar + 1) * ((int) newChar + 1) / newChar);
            newStr = newStr + newChar;
        }
        return newStr;
    }
}
