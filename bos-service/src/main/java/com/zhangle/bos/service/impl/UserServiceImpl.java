package com.zhangle.bos.service.impl;

import com.zhangle.bos.domain.TUserEntity;
import com.zhangle.bos.impl.IUserDao;
import com.zhangle.bos.utils.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Administrator on 2017/10/14.
 */
@Service
@Transactional
public class UserServiceImpl implements IUserService {

    @Autowired
    private IUserDao userDao;



    @Override
    public TUserEntity login(TUserEntity user) {
        //使用MD5
        String password = MD5Utils.md5(user.getPassword());
        return userDao.findUserUsernameAndPassword(user.getUsername(),password);
    }
}
