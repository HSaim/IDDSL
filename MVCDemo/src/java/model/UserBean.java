/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Habiba Saim
 */
public class UserBean implements java.io.Serializable {
    
    //Variables Declaration
    private int userId;    
    private String username;
    private String password;
    private String priEmail;
    private String secEmail;
    private String firstName;
    private String lastName;
    private String posAddress;
    private String perAddress;
    private String workPhone;
    private String homePhone;
    private String mobPhone;
    private String hidden;
    
    public boolean added;
    public boolean duplicateUser;
    public boolean validUser;
     
    //Getters and Setters
    public boolean isValidUser() {
        return validUser;
    }

    public void setValidUser(boolean validUser) {
        this.validUser = validUser;
    }
    
   
    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getUserId() {
        return userId;
    }
    
    public String getUserName() {
       return username;
    }

    public void setUserName(String newUsername) {
       username = newUsername;
    }
    
    public String getPassword() {
       return password;
    }

    public void setPassword(String newPassword) {
       password = newPassword;
    }

    public String getPriEmail() {
       return priEmail;
    }

    public void setPriEmail(String newPriEmail) {
       priEmail = newPriEmail;
    }
    
    public String getSecEmail() {
       return secEmail;
    }

    public void setSecEmail(String newSecEmail) {
       secEmail = newSecEmail;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String newFirstName) {
       firstName = newFirstName;
    }
    
    public String getLastName() {
       return lastName;
    }

    public void setLastName(String newLastName) {
       lastName = newLastName;
    }
    
    public String getPosAddress() {
       return posAddress;
    }

    public void setPosAddress(String newPosAddress) {
       posAddress = newPosAddress;
    }
    
    public String getPerAddress() {
       return perAddress;
    }

    public void setPerAddress(String newPerAddress) {
       perAddress = newPerAddress;
    }
    
    public String getWorkPhone() {
       return workPhone;
    }

    public void setWorkPhone(String newWorkPhone) {
       workPhone = newWorkPhone;
    }
    
    public String getHomePhone() {
       return homePhone;
    }

    public void setHomePhone(String newHomePhone) {
       homePhone = newHomePhone;
    }
    
    public String getMobPhone() {
       return mobPhone;
    }

    public void setMobPhone(String newMobPhone) {
       mobPhone = newMobPhone;
    }
    
    public String getHidden() {
       return hidden;
    }
    public void setHidden(String newHidden) {
       hidden = newHidden;
    }
    
    public boolean isAdded() {
       return added;
    }

    public void setAdded(boolean newAdded) {
       added = newAdded;
    }
    
    public boolean isDuplicateUser() {
       return duplicateUser;
    }

    public void setDuplicateUser(boolean newDuplicateUser) {
       duplicateUser = newDuplicateUser;
    }
}
