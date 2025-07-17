package com.bcwellness.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

/**
 * Password utility class for secure password hashing and verification
 * Uses SHA-256 with salt for password security
 */
public class PasswordUtil {
    
    /**
     * Generates a random salt for password hashing
     * @return byte array containing the salt
     */
    private static byte[] generateSalt() {
        SecureRandom random = new SecureRandom();
        byte[] salt = new byte[16];
        random.nextBytes(salt);
        return salt;
    }
    
    /**
     * Converts byte array to hexadecimal string
     * @param bytes byte array to convert
     * @return hexadecimal string representation
     */
    private static String bytesToHex(byte[] bytes) {
        StringBuilder result = new StringBuilder();
        for (byte b : bytes) {
            result.append(String.format("%02x", b));
        }
        return result.toString();
    }
    
    /**
     * Converts hexadecimal string to byte array
     * @param hex hexadecimal string
     * @return byte array
     */
    private static byte[] hexToBytes(String hex) {
        int len = hex.length();
        byte[] data = new byte[len / 2];
        for (int i = 0; i < len; i += 2) {
            data[i / 2] = (byte) ((Character.digit(hex.charAt(i), 16) << 4)
                    + Character.digit(hex.charAt(i + 1), 16));
        }
        return data;
    }
    
    /**
     * Hashes a password with salt using SHA-256
     * @param password the password to hash
     * @param salt the salt to use
     * @return hashed password as hexadecimal string
     */
    private static String hashPassword(String password, byte[] salt) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(salt);
            byte[] hashedPassword = md.digest(password.getBytes());
            return bytesToHex(hashedPassword);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("SHA-256 algorithm not available", e);
        }
    }
    
    /**
     * Hashes a password with generated salt
     * @param password the password to hash
     * @return combined salt and hashed password (salt:hash)
     */
    public static String hashPassword(String password) {
        byte[] salt = generateSalt();
        String hashedPassword = hashPassword(password, salt);
        return bytesToHex(salt) + ":" + hashedPassword;
    }
    
    /**
     * Verifies a password against a stored hash
     * @param password the password to verify
     * @param storedHash the stored hash (salt:hash format)
     * @return true if password matches, false otherwise
     */
    public static boolean verifyPassword(String password, String storedHash) {
        try {
            String[] parts = storedHash.split(":");
            if (parts.length != 2) {
                return false;
            }
            
            byte[] salt = hexToBytes(parts[0]);
            String originalHash = parts[1];
            String passwordHash = hashPassword(password, salt);
            
            return originalHash.equals(passwordHash);
        } catch (Exception e) {
            return false;
        }
    }
    
    /**
     * Validates password strength
     * @param password the password to validate
     * @return true if password meets requirements, false otherwise
     */
    public static boolean isValidPassword(String password) {
        if (password == null || password.length() < 6) {
            return false;
        }
        
        // Additional password strength requirements can be added here
        // For now, just check minimum length
        return true;
    }
}