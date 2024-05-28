package com.regis.link.service;

import com.regis.link.model.Order;
import com.regis.link.model.ShoppingCart;

import java.util.List;


public interface OrderService {
    Order save(ShoppingCart shoppingCart);

    List<Order> findAll(String username);

    List<Order> findALlOrders();

    Order acceptOrder(Long id);

    void cancelOrder(Long id);

    List<Order> findByUsername(String username);

    Order findOrderById(Long orderId);
}
