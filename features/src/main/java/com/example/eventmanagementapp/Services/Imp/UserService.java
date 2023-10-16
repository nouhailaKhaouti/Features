package com.example.eventmanagementapp.Services.Imp;

import com.example.eventmanagementapp.Domain.ResponseEntity;
import com.example.eventmanagementapp.Domain.UserE;
import com.example.eventmanagementapp.Repositories.facad.UserRepositoryI;
import jakarta.enterprise.context.RequestScoped;
import jakarta.enterprise.context.SessionScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import jakarta.servlet.http.HttpServletRequest;
import org.mindrot.jbcrypt.BCrypt;

import java.io.Serializable;
import java.sql.SQLException;

public class UserService  {
    private final UserRepositoryI userRepositoryI;

    public UserService(UserRepositoryI userRepositoryI){
        this.userRepositoryI=userRepositoryI;
    }

    public ResponseEntity create(UserE user) throws SQLException {
        if(user!=null){
            if(userRepositoryI.findByEmail(user.getEmail())==null){
                if (user.getPassword() != null) {
                    String hashedPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
                    user.setPassword(hashedPassword);
                }
                if(userRepositoryI.save(user)){
                    return new ResponseEntity("your account has been added successfully ",200);
                }else{
                    return new ResponseEntity("an error has occurred while creating your account please try again later ",404);
                }
            }else{
                return new ResponseEntity("this email is already in use ",404);
            }
        }else{
            return new ResponseEntity("the user your trying to insert is null please try again",404);
        }
    }

    public ResponseEntity logIn(UserE user) throws SQLException{
        UserE newUser=userRepositoryI.findByEmail(user.getEmail());
        if(newUser!=null){
            if(BCrypt.checkpw(user.getPassword(), newUser.getPassword())){

                return new ResponseEntity(newUser.getUsername()+" Welcome",200);
            }else{
                return new ResponseEntity("the password your providing is incorrect",404);
            }
        }else{
            return new ResponseEntity("there's no user with the email you provided",404);
        }
    }
}
