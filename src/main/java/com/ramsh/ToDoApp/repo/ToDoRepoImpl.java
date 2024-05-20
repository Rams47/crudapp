package com.ramsh.ToDoApp.repo;

import com.ramsh.ToDoApp.model.ToDo;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class ToDoRepoImpl implements IToDoRepo{
	
	@Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<ToDo> getAllToDoItems() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("from ToDo", ToDo.class).list();
        }
    }

    @Override
    public ToDo getToDoItemById(Long id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(ToDo.class, id);
        }
    }

    @Override
    public boolean saveOrUpdateToDoItem(ToDo todo) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.saveOrUpdate(todo);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean deleteToDoItem(Long id) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            ToDo todo = session.get(ToDo.class, id);
            if (todo != null) {
                session.delete(todo);
                transaction.commit();
                return true;
            }
            return false;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
            return false;
        }
    }
}
