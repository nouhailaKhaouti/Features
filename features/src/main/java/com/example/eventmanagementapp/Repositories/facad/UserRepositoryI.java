package com.example.eventmanagementapp.Repositories.facad;

import com.example.eventmanagementapp.Domain.UserE;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public interface UserRepositoryI {

    public boolean save(UserE user)throws SQLException;
    public void delete(UserE user)throws SQLException;
    public boolean update(UserE user)throws SQLException;
    public UserE findById(Long id)throws SQLException;
    public Optional<UserE> findByEmail(String email)throws SQLException;
    public List<UserE> getAllUserEs()throws SQLException;
}
