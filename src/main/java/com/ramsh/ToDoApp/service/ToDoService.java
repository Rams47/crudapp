package com.ramsh.ToDoApp.service;

import com.ramsh.ToDoApp.model.ToDo;
import com.ramsh.ToDoApp.repo.IToDoRepo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ToDoService {
	
	@Autowired
    private IToDoRepo repo;

    public List<ToDo> getAllToDoItems() {
        return repo.getAllToDoItems();
    }

    public ToDo getToDoItemById(Long id) {
        return repo.getToDoItemById(id);
    }

    public boolean updateStatus(Long id) {
        ToDo todo = getToDoItemById(id);
        todo.setStatus("Completed");
        return saveOrUpdateToDoItem(todo);
    }

    public boolean saveOrUpdateToDoItem(ToDo todo) {
        return repo.saveOrUpdateToDoItem(todo);
    }

    public boolean deleteToDoItem(Long id) {
        return repo.deleteToDoItem(id);
    }
	
}