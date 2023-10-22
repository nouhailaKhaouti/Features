package com.example.eventmanagementapp.Repositories.facad;

import com.example.eventmanagementapp.Domain.Category;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public interface CategoryRepositoryI {

    public boolean save(Category category)throws SQLException;
    public boolean delete(Category category)throws SQLException;
    public boolean update(Category category)throws SQLException;
    public Optional<Category> findById(Long id)throws SQLException;
    public Optional<Category> findByName(String name)throws SQLException;
    public List<Category> getAllCategories()throws SQLException;
}
