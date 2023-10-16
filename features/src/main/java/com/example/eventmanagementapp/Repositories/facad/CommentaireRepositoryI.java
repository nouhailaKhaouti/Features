package com.example.eventmanagementapp.Repositories.facad;

import com.example.eventmanagementapp.Domain.Commentaire;

import java.sql.SQLException;
import java.util.List;

public interface CommentaireRepositoryI {

    public void save(Commentaire commentaire)throws SQLException;
    public void delete(Long id)throws SQLException;
    public void update(Long id,Commentaire commentaire)throws SQLException;
    public Commentaire findById(Long id)throws SQLException;
    public List<Commentaire> getAllCommentaires()throws SQLException;
}
