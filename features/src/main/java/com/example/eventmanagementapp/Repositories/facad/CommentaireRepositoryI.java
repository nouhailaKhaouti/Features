package com.example.eventmanagementapp.Repositories.facad;

import com.example.eventmanagementapp.Domain.Commentaire;
import com.example.eventmanagementapp.Domain.Commentaire;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public interface CommentaireRepositoryI {

    public boolean save(Commentaire commentaire)throws SQLException;
    public boolean delete(Commentaire commentaire)throws SQLException;
    public boolean update(Commentaire commentaire)throws SQLException;
    public Optional<Commentaire> findById(Long id)throws SQLException;
    public List<Commentaire> getAllCommentaire(Long id)throws SQLException;
}
