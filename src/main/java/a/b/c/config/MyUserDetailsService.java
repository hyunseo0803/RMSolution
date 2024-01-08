package a.b.c.config;

import a.b.c.service.MemberService;
import a.b.c.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
public class MyUserDetailsService implements UserDetailsService {

    private final MemberService memberService;


    @Autowired
    public MyUserDetailsService(MemberService memberService) {
        this.memberService = memberService;
    }
    @Override
    public UserDetails loadUserByUsername(String insertedUserId) throws UsernameNotFoundException {
        Optional<MemberVO> findOne = memberService.findOne(insertedUserId);
        MemberVO member = findOne.orElseThrow(() -> new UsernameNotFoundException("없는 회원임"));

        return User.builder()
                .username(member.getMid())
                .password(member.getPw())
                .roles("USER")
                .build();
    }

}
