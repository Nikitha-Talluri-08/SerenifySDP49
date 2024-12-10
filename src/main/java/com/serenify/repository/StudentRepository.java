package com.serenify.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.serenify.model.Student;

@Repository
public interface StudentRepository extends JpaRepository<Student, Integer>
{
	@Query("SELECT s FROM Student s WHERE s.email = :email AND s.password = :password")
	Student checkStudentLogin(@Param("email") String email, @Param("password") String password);

	Student findByEmail(String email);

	Student findByEmailAndPassword(String email, String password);

}
