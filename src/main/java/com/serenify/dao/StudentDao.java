package com.serenify.dao;

import com.serenify.model.Student;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;

public class StudentDao {
    private EntityManager entityManager;

    public StudentDao() {
        entityManager = Persistence.createEntityManagerFactory("serenify").createEntityManager();
    }

    public boolean saveStudent(Student student) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.persist(student);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        }
    }
}
