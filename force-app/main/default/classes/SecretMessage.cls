public with sharing class SecretMessage {
    public static Blob message;
    public static Blob key;
    static{
       key= Crypto.generateAesKey(128);
    }
    @AuraEnabled(cacheable=true)
    public static  Blob getEncryptMessage(String clearText){
       //SecretMessage sm= new SecretMessage(clearText);
        Blob ciphertext=SecretMessage.encryptMessage(clearText);
        
        return getDecryptMessage(ciphertext);
    }
      @AuraEnabled(cacheable=true)
    public static  Blob getDecryptMessage(Blob ciphertext){
      
      // SecretMessage sm= new SecretMessage(ciphertext);
      
        Blob cleartext=SecretMessage.decryptMessage(ciphertext);
        return cleartext;
    }
    public static Blob encryptMessage(String clearText){
     //   Blob key = Crypto.generateAesKey(192);
      Blob data = Blob.valueOf(clearText);
        Blob encrypted = Crypto.encryptWithManagedIV('AES128', SecretMessage.key, data);
        System.debug(encrypted);
       // Blob decrypted = Crypto.decryptWithManagedIV('AES192', key, encrypted);
        //String decryptedString = decrypted.toString();
        //System.debug(decryptedString);
        return encrypted;
    }
     public static Blob decryptMessage(Blob ciphertext){
      System.debug(cipherText);
    //    Blob data = Blob.valueOf(ciphertext);
        Blob decrypted = Crypto.decryptWithManagedIV('AES128', SecretMessage.key, ciphertext);
        String decryptedString = decrypted.toString();
        System.debug(decryptedString);
        return  decrypted;
    }
}