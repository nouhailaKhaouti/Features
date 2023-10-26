package com.example.eventmanagementapp.Services.Imp;

import com.example.eventmanagementapp.Domain.Category;
import com.example.eventmanagementapp.Domain.Category;
import com.example.eventmanagementapp.Domain.ResponseEntity;
import com.example.eventmanagementapp.Repositories.facad.CategoryRepositoryI;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public class CategoryService {

    private final CategoryRepositoryI categoryRepositoryI;

    public CategoryService(CategoryRepositoryI categoryRepositoryI){
        this.categoryRepositoryI=categoryRepositoryI;
    }

    public ResponseEntity create(Category category) throws SQLException {
        if(category!=null){
            if(categoryRepositoryI.findByName(category.getName()).isEmpty()){
                if(categoryRepositoryI.save(category)){
                    return new ResponseEntity("the category has been added successfully ",200);
                }
                    return new ResponseEntity("an error has occurred while creating this category please be patient until we fix the problem ",404);
            }
                return new ResponseEntity("this category already exist ",404);
        }
            return new ResponseEntity("the category your trying to insert is null please try again",404);
    }

    public ResponseEntity update(Category category)throws SQLException{
        if(category!=null){
            Optional<Category> categoryOptional=categoryRepositoryI.findById(category.getId());
            if(categoryOptional.isPresent()){
                if(categoryRepositoryI.update(categoryOptional.get())){
                    return new ResponseEntity("the category has been updated successfully ",200);
                }
                return new ResponseEntity("an error has occurred while updating this category please be patient until we fix the problem ",404);
            }
            return new ResponseEntity("this category doesn't exist ",404);
        }
        return new ResponseEntity("the category your trying to update is null please try again",404);
    }

    public List<Category> findAll() throws SQLException {
        return categoryRepositoryI.getAllCategories();
    }

    public ResponseEntity delete(Long id) throws SQLException{
        Optional<Category> category=categoryRepositoryI.findById(id);
        if(category.isPresent()){
            if(categoryRepositoryI.delete(category.get())){
                return new ResponseEntity("the category has been deleted successfully ",200);
            }
            return new ResponseEntity("An error occurred while deleting this category ",404);
        }
        return new ResponseEntity("The category your trying to delete doesn't exist",404);
    }

    public Optional<Category> findById(Long id) throws SQLException{
        return categoryRepositoryI.findById(id);
    }
}
