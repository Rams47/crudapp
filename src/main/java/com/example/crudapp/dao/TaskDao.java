package com.example.crudapp.dao;

import java.util.List;

import com.example.crudapp.model.Task;

public interface TaskDao {
    void save(Task task);
    void update(Task task);
    void delete(Long id);
    Task findById(Long id);
    List<Task> findAll();
}
