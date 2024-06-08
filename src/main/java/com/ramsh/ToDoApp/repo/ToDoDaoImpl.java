package com.ramsh.ToDoApp.repo;

import com.ramsh.ToDoApp.model.ToDo;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class ToDoDaoImpl implements ToDoDao {

    @Autowired
    private EntityManager entityManager;

    @Override
    @Transactional(readOnly = true)
    public List<ToDo> getAllToDoItems() {
        Query query = entityManager.createQuery("FROM ToDo", ToDo.class);
        return query.getResultList();
    }

    @Override
    @Transactional(readOnly = true)
    public ToDo getToDoItemById(Long id) {
        return entityManager.find(ToDo.class, id);
    }

    @Override
    @Transactional
    public boolean saveOrUpdateToDoItem(ToDo todo) {
        try {
            entityManager.merge(todo);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    @Transactional
    public boolean deleteToDoItem(Long id) {
        try {
            ToDo todo = entityManager.find(ToDo.class, id);
            if (todo != null) {
                entityManager.remove(todo);
                return true;
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}