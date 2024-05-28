package com.regis.link.service;

import com.regis.link.dto.AdminDto;
import com.regis.link.model.Admin;

public interface AdminService {
    Admin save(AdminDto adminDto);

    Admin findByUsername(String username);
}
