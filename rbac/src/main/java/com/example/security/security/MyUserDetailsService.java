package com.example.security.security;

import com.example.security.dao.MemberDao;
import com.example.security.model.Member;
import com.example.security.model.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class MyUserDetailsService implements UserDetailsService {

    @Autowired
    private MemberDao memberDao;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        // 從資料庫中查詢 Member 數據
        Member member = memberDao.getMemberByEmail(username);

        if (member == null) {
            throw new UsernameNotFoundException("Member not found for: " + username);

        } else {

            String memberEmail = member.getEmail();
            String memberPassword = member.getPassword();

            List<Role> roleList = memberDao.getRolesByMemberId(member.getMemberId());

            //
            List<GrantedAuthority> authorities = convertToAuthorities(roleList);

            // 轉換成 Spring Security 指定的 User 格式
            return new User(memberEmail, memberPassword, authorities);
        }
    }
    private List<GrantedAuthority> convertToAuthorities(List<Role> roleList){
        List<GrantedAuthority> authorities = new ArrayList<>();

        for (Role role : roleList){
            authorities.add(new SimpleGrantedAuthority(role.getRoleName()));
        }
        return authorities;
    }
}
