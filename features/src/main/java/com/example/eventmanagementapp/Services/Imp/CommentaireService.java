package com.example.eventmanagementapp.Services.Imp;

import com.example.eventmanagementapp.Domain.Commentaire;
import com.example.eventmanagementapp.Domain.ResponseEntity;
import com.example.eventmanagementapp.Domain.UserE;
import com.example.eventmanagementapp.Repositories.Imp.UserRepository;
import com.example.eventmanagementapp.Repositories.facad.CommentaireRepositoryI;
import com.example.eventmanagementapp.Repositories.facad.UserRepositoryI;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public class CommentaireService {

    private final CommentaireRepositoryI commentaireRepositoryI;

    public CommentaireService(CommentaireRepositoryI commentaireRepositoryI){
        this.commentaireRepositoryI=commentaireRepositoryI;
    }

    UserRepositoryI userRepository=new UserRepository();
    public ResponseEntity create(Commentaire commentaire) throws SQLException {
        if(commentaire!=null){
            Optional<UserE> user=userRepository.findByEmail(commentaire.getUser().getEmail());
            if(user.isPresent()) {
                commentaire.setUser(user.get());
                if (commentaireRepositoryI.save(commentaire)) {
                    return new ResponseEntity("the comment has been added successfully ", 200);
                }
                return new ResponseEntity("an error has occurred while creating this comment please be patient until we fix the problem ", 404);
            }
            return new ResponseEntity("Can't find user With the email you provided ", 404);
        }
        return new ResponseEntity("the comment your trying to insert is null please try again",404);
    }

    public ResponseEntity update(Commentaire commentaire)throws SQLException{
        if(commentaire!=null){
            Optional<Commentaire> commentaireOptional=commentaireRepositoryI.findById(commentaire.getId());
            if(commentaireOptional.isPresent()){
                commentaireOptional.get().setText(commentaire.getText());
                if(commentaireRepositoryI.update(commentaireOptional.get())){
                    return new ResponseEntity("the commentaire has been updated successfully ",200);
                }
                return new ResponseEntity("an error has occurred while updating this commentaire please be patient until we fix the problem ",404);
            }
            return new ResponseEntity("this commentaire doesn't exist ",404);
        }
        return new ResponseEntity("the commentaire your trying to update is null please try again",404);
    }

    public List<Commentaire> findAllByEvent(Long id) throws SQLException {
        return commentaireRepositoryI.getAllCommentaire(id);
    }

    public ResponseEntity delete(Long id) throws SQLException{
        Optional<Commentaire> commentaire=commentaireRepositoryI.findById(id);
        if(commentaire.isPresent()){
            if(commentaireRepositoryI.delete(commentaire.get())){
                return new ResponseEntity("the commentaire has been deleted successfully ",200);
            }
            return new ResponseEntity("An error occurred while deleting this commentaire ",404);
        }
        return new ResponseEntity("The commentaire your trying to delete doesn't exist",404);
    }
}
