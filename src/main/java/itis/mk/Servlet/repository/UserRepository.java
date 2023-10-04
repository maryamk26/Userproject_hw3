package itis.mk.Servlet.repository;

import itis.mk.model.User;

import java.util.List;
import java.util.Optional;

public interface UserRepository {
    boolean createUser(User user);

    Optional<User> getUserById(Long id);

    List<User> getUserByEmail(String email);

    List<User> getUsersByAge(int age);

    List<User> getAllUsers();

    boolean updateUser(User user);

    boolean deleteUserById(Long id);
}
