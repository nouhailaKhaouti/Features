package com.example.eventmanagementapp.Repositories.facad;

import com.example.eventmanagementapp.Domain.Billet;

import java.sql.SQLException;
import java.util.List;

public interface BilletRepositoryI {

    public boolean save(Billet billet)throws SQLException;
    public void delete(Long id)throws SQLException;
    public void update(Long id,Billet billet)throws SQLException;
    public Billet findById(Long id)throws SQLException;
    public List<Billet> getAllBillets()throws SQLException;
}
