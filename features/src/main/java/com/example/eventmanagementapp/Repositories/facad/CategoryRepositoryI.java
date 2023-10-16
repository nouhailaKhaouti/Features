package com.example.eventmanagementapp.Repositories.facad;

import com.example.eventmanagementapp.Domain.Category;

import java.sql.SQLException;
import java.util.List;

public interface CategoryRepositoryI {

    public void save(Category category)throws SQLException;
    public void delete(Long id)throws SQLException;
    public void update(Long id,Category category)throws SQLException;
    public Category findById(Long id)throws SQLException;
    public List<Category> getAllCategories()throws SQLException;
}
