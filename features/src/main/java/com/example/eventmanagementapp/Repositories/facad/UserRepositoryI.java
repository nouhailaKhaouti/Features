package com.example.eventmanagementapp.Repositories.facad;

import com.example.eventmanagementapp.Domain.UserE;

import java.sql.SQLException;
import java.util.List;

public interface UserRepositoryI {

    public boolean save(UserE user)throws SQLException;
    public void delete(Long id)throws SQLException;
    public void update(Long id,UserE user)throws SQLException;
    public UserE findById(Long id)throws SQLException;
    public UserE findByEmail(String email)throws SQLException;
    public List<UserE> getAllUserEs()throws SQLException;
}
