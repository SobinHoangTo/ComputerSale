/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import model.*;
import jakarta.servlet.http.HttpServletRequest;
import java.lang.reflect.Array;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

/**
 *
 * @author vdqvi
 */
public class MyUtils {

    public static String genCode(int length) {
        Random rd = new Random();
        StringBuilder code = new StringBuilder();
        for (int i = 0; i < length; i++) {
            int temp = rd.nextInt(0, 62);
            if (temp < 10) {
                temp += 48;
            } else if (temp >= 10 && temp < 36) {
                temp += 55;
            } else {
                temp += 61;
            }
            code.append((char) temp);
        }
        return code.toString();
    }

    public static String getMd5(String input) {
        try {

            // Static getInstance method is called with hashing MD5
            MessageDigest md = MessageDigest.getInstance("MD5");

            // digest() method is called to calculate message digest
            // of an input digest() return array of byte
            byte[] messageDigest = md.digest(input.getBytes());

            // Convert byte array into signum representation
            BigInteger no = new BigInteger(1, messageDigest);

            // Convert message digest into hex value
            String hashtext = no.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        } // For specifying wrong message digest algorithms
        catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    public static <T> List<T> getArrayListByPaging(ArrayList<T> list, int pageNumber, int ItemsOfPage) {
        return list.subList((pageNumber - 1) * ItemsOfPage, ((pageNumber * ItemsOfPage) > list.size()) ? list.size() : (pageNumber * ItemsOfPage));
    }

    public static <K, V> Map<K, V> getMapByPaging(Map<K, V> pMap, int pageNumber, int itemsPerPage) {
        Map<K, V> paginatedMap = new LinkedHashMap<>();

        if (pMap == null || pMap.isEmpty() || itemsPerPage <= 0 || pageNumber <= 0) {
            return paginatedMap;
        }

        int start = (pageNumber - 1) * itemsPerPage;
        int end = Math.min(start + itemsPerPage, pMap.size());

        if (start >= pMap.size()) {
            return paginatedMap; // Return empty map if start index is out of bounds
        }

        int currentIndex = 0;
        for (Map.Entry<K, V> entry : pMap.entrySet()) {
            if (currentIndex >= start && currentIndex < end) {
                paginatedMap.put(entry.getKey(), entry.getValue());
            }
            currentIndex++;
        }
        return paginatedMap;
    }

    public static <K, V> LinkedHashMap<K, V> sortMap(Map<K, V> p, Comparator<K> comparator) {
        // Convert Map entries to a List
        List<Map.Entry<K, V>> entries = new ArrayList<>(p.entrySet());

        // Sort the list of entries using the custom comparator
        entries.sort((e1, e2) -> comparator.compare(e1.getKey(), e2.getKey()));

        // Create a LinkedHashMap to maintain insertion order
        LinkedHashMap<K, V> sortedMap = new LinkedHashMap<>();
        for (Map.Entry<K, V> entry : entries) {
            sortedMap.put(entry.getKey(), entry.getValue());
        }

        return sortedMap;
    }

    public static void setAlertAttributes(HttpServletRequest request, boolean status, String action) {
        String alertMessage = status ? "Successfully " + action + " ." : "Failed to " + action + " .";
        String alertType = status ? "success" : "danger";
        request.setAttribute("alertMessage", alertMessage);
        request.setAttribute("alertType", alertType);
    }

    private static final String[][] DIACRITICS_MAP = {
        {"áàảãạâấầẩẫậăắằẳẵặ", "a"},
        {"éèẻẽẹêếềểễệ", "e"},
        {"íìỉĩị", "i"},
        {"óòỏõọôốồổỗộơớờởỡợ", "o"},
        {"úùủũụưứừửữự", "u"},
        {"ýỳỷỹỵ", "y"},
        {"đ", "d"}
    };

    public static String removeDiacritics(String input) {
        for (String[] map : DIACRITICS_MAP) {
            for (char c : map[0].toCharArray()) {
                input = input.replace(c, map[1].charAt(0));
            }
        }
        return input;
    }

    public static void validateParameters(String... params) {
        for (String param : params) {
            if (param == null) {
                throw new IllegalArgumentException("All parameters are required.");
            }
        }
    }

    public static String[] convertKeywords(String keywordString) {
        return keywordString.split("\\s+");
    }
  public static boolean containsKeywords(String text, String[] keywords) {
        return Arrays.stream(keywords).anyMatch(text.toLowerCase()::contains);
    }

    public static String toSEOUrl(String productName) {
        return productName != null ? productName.toLowerCase().replaceAll("\\s", "-") : null;
    }

    public static void main(String[] args) {

    }

}
