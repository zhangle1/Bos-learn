package com.zhangle.bos.impl;

import com.zhangle.bos.dao.BaseDaoImpl;
import com.zhangle.bos.domain.TUserEntity;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/10/14.
 */

@Repository
public class UserDaoImpl extends BaseDaoImpl<TUserEntity> implements IUserDao {

    public UserDaoImpl() {

    }

    @Override
    public TUserEntity findUserUsernameAndPassword(String username, String password) {

        String hql="FROM TUserEntity u WHERE u.username = ? AND u.password = ?";
        List<TUserEntity> list = (List<TUserEntity>) this.getHibernateTemplate().find(hql, username, password);
        Logger.getLogger(UserDaoImpl.class).fatal("数据分析:"+list.size());
        if (list != null&&list.size()>0) {
            return list.get(0);
        }

        return null;
    }
}
