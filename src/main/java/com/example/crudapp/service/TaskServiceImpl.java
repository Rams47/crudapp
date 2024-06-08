package com.example.crudapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.crudapp.dao.TaskDao;
import com.example.crudapp.model.Task;

@Service
public class TaskServiceImpl implements TaskService {

    @Autowired
    private TaskDao taskDao;

    @Override
    public void saveTask(Task task) {
        taskDao.save(task);
    }

    @Override
    public void updateTask(Task task) {
        taskDao.update(task);
    }

    @Override
    public void deleteTask(Long id) {
        taskDao.delete(id);
    }

    @Override
    public Task getTaskById(Long id) {
        return taskDao.findById(id);
    }

    @Override
    public List<Task> getAllTasks() {
        return taskDao.findAll();
    }
}