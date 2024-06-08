package com.example.crudapp.service;

import java.util.List;

import com.example.crudapp.model.Task;

public interface TaskService {
    void saveTask(Task task);
    void updateTask(Task task);
    void deleteTask(Long id);
    Task getTaskById(Long id);
    List<Task> getAllTasks();
}
