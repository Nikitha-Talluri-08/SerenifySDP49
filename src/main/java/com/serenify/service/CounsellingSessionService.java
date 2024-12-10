package com.serenify.service;

import com.serenify.model.CounsellingSession;
import com.serenify.repository.CounsellingSessionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CounsellingSessionService {

    @Autowired
    private CounsellingSessionRepository counsellingSessionRepository;

    public void saveCounsellingSession(CounsellingSession session) {
        counsellingSessionRepository.save(session);
    }

    public List<CounsellingSession> getAllSessions() {
        return counsellingSessionRepository.findAll();
    }
}
