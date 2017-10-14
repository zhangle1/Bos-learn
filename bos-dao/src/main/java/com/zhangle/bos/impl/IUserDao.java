package com.zhangle.bos.impl;

import com.zhangle.bos.domain.TUserEntity;

/**
 * Created by Administrator on 2017/10/14.
 */
public interface IUserDao {
    TUserEntity findUserUsernameAndPassword(String username, String password);

}
