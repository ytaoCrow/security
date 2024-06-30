package com.example.security.dao;


import com.example.security.model.Member;
import com.example.security.model.Role;


import java.util.List;

public interface MemberDao {

    Member getMemberById(Integer memberId);

    Member getMemberByEmail(String email);

    Integer createMember(Member member);

    List<Role> getRolesByMemberId(Integer memberId);
}
