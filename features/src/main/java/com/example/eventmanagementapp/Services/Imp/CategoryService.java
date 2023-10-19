package com.example.eventmanagementapp.Services.Imp;

import com.example.eventmanagementapp.Domain.Category;
import com.example.eventmanagementapp.Domain.ResponseEntity;
import com.example.eventmanagementapp.Repositories.facad.CategoryRepositoryI;

import java.sql.SQLException;
import java.util.List;

public class CategoryService {

    private final CategoryRepositoryI categoryRepositoryI;

    public CategoryService(CategoryRepositoryI categoryRepositoryI){
        this.categoryRepositoryI=categoryRepositoryI;
    }

    public ResponseEntity create(Category category) throws SQLException {
        if(category!=null){
            if(categoryRepositoryI.findByName(category.getName())==null){
                if(categoryRepositoryI.save(category)){
                    return new ResponseEntity("the category has been added successfully ",200);
                }else{
                    return new ResponseEntity("an error has occurred while creating this category please be patient until we fix the problem ",404);
                }
            }else{
                return new ResponseEntity("this category already exist ",404);
            }
        }else{
            return new ResponseEntity("the category your trying to insert is null please try again",404);
        }
    }

    public List<Category> findAll() throws SQLException {
        return categoryRepositoryI.getAllCategories();
    }
}
