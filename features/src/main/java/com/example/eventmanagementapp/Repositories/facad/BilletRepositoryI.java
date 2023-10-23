package com.example.eventmanagementapp.Repositories.facad;

import com.example.eventmanagementapp.Domain.Billet;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public interface BilletRepositoryI {

    public boolean save(Billet billet)throws SQLException;
    public boolean delete(Billet billet)throws SQLException;
    public boolean update(Billet billet)throws SQLException;
    public Optional<Billet> findById(Long id)throws SQLException;
    public List<Billet> getAllBillets()throws SQLException;
    public Optional<Billet> findByEventType(Billet billet)throws SQLException;
    public List<Billet> getAll(Long id) throws SQLException;
}
