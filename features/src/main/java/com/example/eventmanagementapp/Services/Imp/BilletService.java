package com.example.eventmanagementapp.Services.Imp;

import com.example.eventmanagementapp.Domain.Billet;
import com.example.eventmanagementapp.Domain.ResponseEntity;
import com.example.eventmanagementapp.Repositories.facad.BilletRepositoryI;

import java.sql.SQLException;

public class BilletService {
    private final BilletRepositoryI billetRepositoryI;

    public BilletService(BilletRepositoryI billetRepositoryI){
        this.billetRepositoryI=billetRepositoryI;
    }

    public boolean save(Billet billet) throws SQLException {
        if(billet!=null){
            return billetRepositoryI.save(billet);
        }else{
            return false;
        }
    }
}
