package com.ramsh.ToDoApp.repo;

import java.util.List;



import com.ramsh.ToDoApp.model.ToDo;


public interface ToDoDao {
	List<ToDo> getAllToDoItems();
    ToDo getToDoItemById(Long id);
    boolean saveOrUpdateToDoItem(ToDo todo);
    boolean deleteToDoItem(Long id);
}
